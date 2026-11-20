// Resolve, verify, or install the native headers selected by a Vulkan binding checkout.
import os
import rand

const headers_repository = 'https://github.com/KhronosGroup/Vulkan-Headers.git'
const volk_repository = 'https://github.com/zeux/volk.git'
const header_directories = ['vulkan', 'vk_video']
const volk_files = ['volk.h', 'volk.c']

fn require_pin(value string, label string) !string {
	if value.len != 40 || !value.bytes().all(it.is_digit() || (it >= `a` && it <= `f`)) {
		return error('${label} must contain a full Git commit ID.')
	}
	return value
}

fn pin(path string) !string {
	return require_pin(os.read_file(path)!.trim_space(), path)
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

fn copy_volk(source string, destination string) ! {
	os.mkdir_all(destination)!
	for name in volk_files {
		os.cp(os.join_path(source, name), os.join_path(destination, name))!
	}
}

fn install(sdk string, headers string, volk string) ! {
	include := os.join_path(sdk, 'include')
	os.cp_all(headers, include, true)!
	copy_volk(volk, os.join_path(include, 'volk'))!
	println('Installed binding-matched Vulkan headers and Volk in ${include}.')
}

// Give the job pinned headers without altering the system loader or SDK.
fn stage_sdk(temp string, source string, headers string, volk string) ! {
	sdk := os.join_path(temp, 'vulkan-sdk-' + rand.uuid_v4())
	os.mkdir(sdk)!
	mut published := false
	defer {
		if !published {
			os.rmdir_all(sdk) or {}
		}
	}
	for directory in ['lib', 'lib64', 'bin'] {
		system := os.join_path(source, directory)
		if os.is_dir(system) {
			os.symlink(system, os.join_path(sdk, directory))!
		}
	}
	install(sdk, headers, volk)!
	// Linux consumers may resolve <volk.h> directly from the SDK include directory.
	copy_volk(volk, os.join_path(sdk, 'include'))!
	line := 'VULKAN_SDK=${sdk}'
	if path := os.getenv_opt('GITHUB_ENV') {
		mut environment := os.open_append(path)!
		defer { environment.close() }
		environment.writeln(line)!
	}
	published = true
	println(line)
}

fn run(args []string) ! {
	usage := 'Usage: v run .github/scripts/binding-headers.vsh verify|stage BINDINGS_DIR\n' +
		'       v run .github/scripts/binding-headers.vsh install BINDINGS_DIR [VOLK_COMMIT]\n' +
		'       v run .github/scripts/binding-headers.vsh install-volk VOLK_COMMIT'
	if args in [['-h'], ['--help']] {
		println(usage)
		return
	}
	if args.len < 2 || args.len > 3
		|| args[0] !in ['verify', 'install', 'stage', 'install-volk']
		|| (args.len == 3 && args[0] != 'install') {
		return error(usage)
	}
	mode := args[0]
	sdk := os.getenv('VULKAN_SDK')
	if mode != 'verify' && (sdk == '' || !os.is_dir(os.join_path(sdk, 'include'))) {
		return error('Set VULKAN_SDK to an SDK with installed headers.')
	}
	if mode == 'stage' && os.user_os() != 'linux' {
		return error('Staging the system Vulkan SDK is supported on Linux.')
	}
	root := if mode == 'install-volk' { '' } else { os.abs_path(args[1]) }
	volk_override := args[2] or { '' }
	volk_commit := if mode == 'install-volk' {
		require_pin(args[1], 'VOLK_COMMIT')!
	} else if volk_override != '' {
		require_pin(volk_override, 'VOLK_COMMIT')!
	} else {
		pin(os.join_path(root, 'VOLK_COMMIT'))!
	}
	registry := if mode == 'install-volk' { '' } else { pin(os.join_path(root, 'REGISTRY_COMMIT'))! }
	runner_temp := os.getenv('RUNNER_TEMP')
	temp := if runner_temp == '' { os.temp_dir() } else { os.abs_path(runner_temp) }
	if temp.contains_any('\r\n') {
		return error('The temporary directory must fit on one GitHub Actions environment line.')
	}
	work := os.join_path(temp, 'vulkan-headers-' + rand.uuid_v4())
	os.mkdir(work)!
	defer { os.rmdir_all(work) or {} }
	volk := os.join_path(work, 'volk')
	fetch(volk, volk_repository, volk_commit)!
	if !volk_files.all(os.is_file(os.join_path(volk, it))) {
		return error('The pinned Volk checkout is missing its native sources.')
	}
	if mode == 'install-volk' {
		copy_volk(volk, os.join_path(sdk, 'include', 'volk'))!
		return
	}
	headers := os.join_path(work, 'headers')
	fetch(headers, headers_repository, registry)!
	include := os.join_path(headers, 'include')
	if !os.is_file(os.join_path(include, 'vulkan', 'vulkan_core.h')) {
		return error('The pinned Vulkan-Headers checkout is missing its native sources.')
	}
	match mode {
		'verify' { verify(root, include, volk)! }
		'install' { install(sdk, include, volk)! }
		else { stage_sdk(temp, os.abs_path(sdk), include, volk)! }
	}
}

run(os.args[1..]) or {
	eprintln(err)
	exit(1)
}
