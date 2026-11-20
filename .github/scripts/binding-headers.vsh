// Resolve, verify, or install the native headers selected by a Vulkan binding checkout.
import os
import rand

const headers_repository = 'https://github.com/KhronosGroup/Vulkan-Headers.git'
const volk_repository = 'https://github.com/zeux/volk.git'
const header_directories = ['vulkan', 'vk_video']
const volk_files = ['volk.h', 'volk.c']

fn pin(path string) !string {
	value := os.read_file(path)!.trim_space()
	if value.len != 40 || !value.bytes().all(it.is_digit() || (it >= `a` && it <= `f`)) {
		return error('${path} must contain a full Git commit ID.')
	}
	return value
}

fn command(args []string) !string {
	result := os.exec(args)
	if result.exit_code != 0 {
		return error('${args[0]} failed (exit ${result.exit_code}): ${result.output.trim_space()}')
	}
	return result.output.trim_space()
}

fn fetch(destination string, repository string, commit string) ! {
	command(['git', 'init', '--quiet', destination])!
	command(['git', '-C', destination, 'fetch', '--quiet', '--depth', '1', repository, commit])!
	command(['git', '-C', destination, '-c', 'core.autocrlf=false', 'checkout', '--quiet', '--detach',
		'FETCH_HEAD'])!
	if command(['git', '-C', destination, 'rev-parse', 'HEAD'])! != commit {
		return error('Expected ${repository} at ${commit}.')
	}
}

fn files(directory string) []string {
	mut paths := []string{}
	for name in header_directories {
		paths << os.walk_ext(os.join_path(directory, name), '.h').map(it[directory.len + 1..])
	}
	paths.sort()
	return paths
}

fn same_source(expected string, actual string) ! {
	// Git for Windows may check out the vendored files with CRLF line endings.
	if os.read_file(expected)!.replace('\r\n', '\n') != os.read_file(actual)!.replace('\r\n', '\n') {
		return error('${actual} differs from its pinned source.')
	}
}

fn verify(root string, headers string, volk string) ! {
	vendor := os.join_path(root, 'c', 'vendor')
	bundled := os.join_path(vendor, 'include')
	pinned := files(headers)
	if pinned.len == 0 || files(bundled) != pinned {
		return error('The bundled Vulkan header list differs from the pinned registry.')
	}
	for path in pinned {
		same_source(os.join_path(headers, path), os.join_path(bundled, path))!
	}
	version := os.read_file(os.join_path(root, 'VERSION'))!.trim_space()
	parts := version.trim_string_left('v').split('.')
	if !version.starts_with('v') || parts.len != 3 || !parts.all(it.len > 0
		&& it.bytes().all(it.is_digit())) {
		return error('Invalid Vulkan registry version: ${version}.')
	}
	core := os.read_file(os.join_path(bundled, 'vulkan', 'vulkan_core.h'))!
	expected := ['#define', 'VK_HEADER_VERSION', parts.last()]
	if !core.split_into_lines().any(it.fields() == expected) {
		return error('Bundled VK_HEADER_VERSION differs from ${version}.')
	}
	for name in volk_files {
		same_source(os.join_path(volk, name), os.join_path(vendor, 'volk', name))!
	}
	println('Bundled Vulkan headers and Volk match their pinned sources.')
}

fn install(sdk string, headers string, volk string) ! {
	include := os.join_path(sdk, 'include')
	destination := os.join_path(include, 'volk')
	os.cp_all(headers, include, true)!
	os.mkdir_all(destination)!
	for name in volk_files {
		os.cp(os.join_path(volk, name), os.join_path(destination, name))!
	}
	println('Installed binding-matched Vulkan headers and Volk in ${include}.')
}

fn run(args []string) ! {
	usage := 'Usage: v run .github/scripts/binding-headers.vsh verify|install BINDINGS_DIR'
	if args in [['-h'], ['--help']] {
		println(usage)
		return
	}
	if args.len != 2 || args[0] !in ['verify', 'install'] {
		return error(usage)
	}
	root := os.abs_path(args[1])
	registry := pin(os.join_path(root, 'REGISTRY_COMMIT'))!
	volk_commit := pin(os.join_path(root, 'VOLK_COMMIT'))!
	sdk := os.getenv('VULKAN_SDK')
	if args[0] == 'install' && (sdk == '' || !os.is_dir(os.join_path(sdk, 'include'))) {
		return error('Set VULKAN_SDK to the CI SDK before installing binding headers.')
	}
	temp := os.getenv('RUNNER_TEMP')
	work := os.join_path(if temp == '' { os.temp_dir() } else { temp }, 'vulkan-headers-' +
		rand.uuid_v4())
	os.mkdir(work)!
	defer { os.rmdir_all(work) or {} }
	headers := os.join_path(work, 'headers')
	volk := os.join_path(work, 'volk')
	fetch(headers, headers_repository, registry)!
	fetch(volk, volk_repository, volk_commit)!
	include := os.join_path(headers, 'include')
	if !os.is_file(os.join_path(include, 'vulkan', 'vulkan_core.h'))
		|| !volk_files.all(os.is_file(os.join_path(volk, it))) {
		return error('The pinned checkouts are missing their native sources.')
	}
	if args[0] == 'verify' {
		verify(root, include, volk)!
	} else {
		install(sdk, include, volk)!
	}
}

run(os.args[1..]) or {
	eprintln(err)
	exit(1)
}
