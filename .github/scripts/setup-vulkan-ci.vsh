// Download and unpack VulkanCI prerequisites, then export their paths to the runner.
import compress.szip
import x.json2
import os
import rand

// Each SDK entry is buffered independently. This bounds memory and the size accepted by szip.
const max_entry_bytes = 256 * 1024 * 1024

struct Platform {
	artifact string
	driver   string
}

struct Manifest {
	file_format_version string = '1.0.0'
	icd                 Driver @[json: 'ICD']
}

struct Driver {
	library_path string
	api_version  string = '1.0.5'
}

fn require_env(name string) !string {
	value := os.getenv(name)
	if value == '' || value.contains_any('\r\n') {
		return error('Expected a nonempty single-line ${name}')
	}
	return value
}

fn download(url string, output string) ! {
	curl := os.find_abs_path_of_executable('curl')!
	mut child := os.new_process(curl)
	child.set_args(['--fail', '--location', '--retry', '5', '--retry-all-errors', '--silent',
		'--show-error', url, '--output', output])
	child.wait()
	defer { child.close() }
	if child.code != 0 {
		return error('curl could not download ${url}: status ${child.code}')
	}
}

fn extract(archive string, destination string) ! {
	mut zip := szip.open(archive, .no_compression, .read_only)!
	defer { zip.close() }
	os.mkdir(destination)!
	for index in 0 .. zip.total()! {
		zip.open_entry_by_index(index)!
		defer { zip.close_entry() }
		name := zip.name()
		parts := name.trim_right('/').split('/')
		if name == '' || name.contains_any('\\:\r\n')
			|| parts.any(it == '' || it == '.' || it == '..' || it.ends_with('.') || it.ends_with(' ')) {
			return error('Unsafe VulkanCI archive entry: ${name}')
		}
		target := os.join_path(destination, ...parts)
		if zip.is_dir()! {
			os.mkdir_all(target)!
			continue
		}
		if os.exists(target) || zip.size() > max_entry_bytes {
			return error('Duplicate or oversized VulkanCI archive entry: ${name}')
		}
		os.mkdir_all(os.dir(target))!
		// Write regular files independently of archive permissions and link metadata.
		mut bytes := []u8{len: int(zip.size())}
		if bytes.len > 0 && zip.read_entry_buf(bytes.data, bytes.len)! != bytes.len {
			return error('Incomplete VulkanCI archive entry: ${name}')
		}
		os.write_file_array(target, bytes)!
	}
}

fn append_lines(path string, lines []string) ! {
	mut file := os.open_append(path)!
	defer { file.close() }
	file.write_string(lines.join('\n') + '\n')!
}

fn runner_path(path string) string {
	return path.replace('\\', '/')
}

fn setup(args []string) ! {
	if args.len != 2 || args.any(!valid_asset_component(it)) {
		return error('Usage: v run .github/scripts/setup-vulkan-ci.vsh SDK_VERSION ARTIFACT_TAG')
	}
	sdk_version := args[0]
	tag := args[1]
	runner := require_env('RUNNER_OS')!
	platform := match runner {
		'Linux' { Platform{'ubuntu-20.04-x64', 'libvk_swiftshader.so'} }
		'macOS' { Platform{'macOS-13-x64', 'libvk_swiftshader.dylib'} }
		'Windows' { Platform{'windows-2022-x64', 'vk_swiftshader.dll'} }
		else { return error('Unsupported runner OS: ${runner}') }
	}
	env_file := require_env('GITHUB_ENV')!
	path_file := if runner == 'Windows' { require_env('GITHUB_PATH')! } else { '' }
	base := 'https://github.com/NcStudios/VulkanCI/releases/download/${tag}'
	// Isolate each attempt so extraction follows only paths created by this process.
	root := os.join_path(require_env('RUNNER_TEMP')!, 'vulkan-ci-' + rand.uuid_v4())
	os.mkdir(root)!
	mut published := false
	defer {
		if !published {
			os.rmdir_all(root) or {}
		}
	}
	sdk_root := os.join_path(root, 'VulkanSDK')
	shader_root := os.join_path(root, 'swiftshader')
	for name, destination in {
		'vulkanSDK-${sdk_version}-${platform.artifact}.zip': sdk_root
		'swiftshader-${platform.artifact}.zip':              shader_root
	} {
		archive := os.join_path(root, name)
		download('${base}/${name}', archive)!
		extract(archive, destination)!
		os.rm(archive)!
	}
	sdk := os.join_path(sdk_root, sdk_version)
	driver := os.join_path(shader_root, platform.driver)
	if !os.is_dir(os.join_path(sdk, 'include')) || !os.is_file(driver) {
		return error('VulkanCI archives are missing SDK headers or the SwiftShader library')
	}
	manifest := os.join_path(shader_root, 'vk_swiftshader_icd.json')
	os.write_file(manifest, json2.encode(Manifest{
		icd: Driver{
			library_path: runner_path(driver)
		}
	}, prettify: true) + '\n')!
	mut environment := [
		'VULKAN_SDK=${runner_path(sdk)}',
		'VULKAN_SDK_VERSION=${sdk_version}',
		'VK_DRIVER_FILES=${runner_path(manifest)}',
	]
	if runner == 'Windows' {
		bin := runner_path(os.join_path(sdk, 'bin'))
		environment << 'VK_LAYER_PATH=${bin}'
		append_lines(path_file, [bin])!
	} else {
		layer_path := os.join_path(sdk, 'share', 'vulkan', 'explicit_layer.d')
		environment << 'VK_LAYER_PATH=${layer_path}'
		variable := if runner == 'Linux' { 'LD_LIBRARY_PATH' } else { 'DYLD_LIBRARY_PATH' }
		mut libraries := os.getenv(variable).split(':').filter(it != '')
		libraries << [os.join_path(sdk, 'lib'), shader_root]
		environment << '${variable}=${libraries.join(':')}'
	}
	append_lines(env_file, environment)!
	published = true
}

fn valid_asset_component(value string) bool {
	return value != '' && value !in ['.', '..']
		&& value.bytes().all(it.is_alnum() || it in [`.`, `_`, `-`])
}

setup(os.args[1..]) or {
	eprintln(err)
	exit(1)
}
