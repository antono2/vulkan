#!/usr/bin/env -S v run

// Installs optional native tooling and verifies the bundled build inputs.
// Running without arguments performs the installation. Use --check for a
// read-only diagnostic pass suitable for support requests and CI.
import os

const usage = 'Usage: v run setup.vsh [--install|--check]\n\n' +
	'  --install  Install native Vulkan tools and this V module (default).\n' + '  --check    Report whether the compiler, bundled headers, loader, and device work.\n'

fn command_exists(name string) bool {
	os.find_abs_path_of_executable(name) or { return false }
	return true
}

fn run(command string) ! {
	println('\n> ${command}')
	result := os.execute(command)
	if result.output.trim_space() != '' {
		println(result.output.trim_right('\r\n'))
	}
	if result.exit_code != 0 {
		return error('command failed with exit code ${result.exit_code}')
	}
}

fn install_linux() ! {
	if command_exists('apt-get') {
		run('sudo apt-get update')!
		run('sudo apt-get install -y build-essential libvulkan-dev libvulkan-volk-dev mesa-vulkan-drivers vulkan-tools')!
		return
	}
	if command_exists('dnf') {
		run('sudo dnf install -y gcc gcc-c++ vulkan-headers vulkan-loader-devel volk-devel vulkan-tools mesa-vulkan-drivers')!
		return
	}
	if command_exists('pacman') {
		run('sudo pacman -S --needed --noconfirm base-devel vulkan-headers vulkan-icd-loader vulkan-tools volk')!
		return
	}
	if command_exists('zypper') {
		run('sudo zypper --non-interactive install -y gcc gcc-c++ vulkan-devel vulkan-tools volk-devel')!
		return
	}
	return error('unsupported Linux package manager; install Vulkan headers, the loader, Volk, vulkaninfo, and a Vulkan ICD, then rerun with --check')
}

fn install_macos() ! {
	if !command_exists('curl') || !command_exists('ditto') {
		return error('curl and ditto are required for automatic macOS setup')
	}
	cache_root := os.join_path(os.cache_dir(), 'antono2', 'vulkan-sdk')
	archive := os.join_path(cache_root, 'vulkan_sdk.zip')
	unpacked := os.join_path(cache_root, 'unpacked')
	os.mkdir_all(unpacked)!
	run('curl --fail --location --output ${os.quoted_path(archive)} https://sdk.lunarg.com/sdk/download/latest/mac/vulkan_sdk.zip')!
	run('ditto -x -k ${os.quoted_path(archive)} ${os.quoted_path(unpacked)}')!
	found :=
		os.execute('find ${os.quoted_path(unpacked)} -type f -path "*/InstallVulkan*.app/Contents/MacOS/InstallVulkan*" -print -quit')
	installer := found.output.trim_space()
	if found.exit_code != 0 || installer == '' {
		return error('the downloaded Vulkan SDK did not contain the expected macOS installer')
	}
	install_root := os.join_path(os.home_dir(), 'VulkanSDK')
	run('sudo ${os.quoted_path(installer)} --root ${os.quoted_path(install_root)} --accept-licenses --default-answer --confirm-command install com.lunarg.vulkan.core com.lunarg.vulkan.usr com.lunarg.vulkan.volk')!
}

fn windows_vulkan_sdk() string {
	mut candidates := [os.getenv('VULKAN_SDK')]
	machine_value :=
		os.execute('powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable(\'VULKAN_SDK\', \'Machine\')"')
	if machine_value.exit_code == 0 {
		candidates << machine_value.output.trim_space()
	}
	for candidate in candidates {
		if candidate == '' {
			continue
		}
		for relative in ['include/vulkan/vulkan.h', 'Include/vulkan/vulkan.h'] {
			if os.is_file(os.join_path(candidate, relative)) {
				return candidate
			}
		}
	}
	return ''
}

fn install_windows() ! {
	installed_sdk := windows_vulkan_sdk()
	if installed_sdk != '' {
		os.setenv('VULKAN_SDK', installed_sdk, true)
		println('Using the installed Vulkan SDK at ${installed_sdk}.')
		return
	}
	if !command_exists('winget') {
		return error('winget is required for automatic Windows setup; install Microsoft App Installer, then try again')
	}
	run('winget install --id KhronosGroup.VulkanSDK --exact --accept-package-agreements --accept-source-agreements')!
	sdk_root := windows_vulkan_sdk()
	if sdk_root == '' {
		return error('the Vulkan SDK installer completed, but no installation containing Vulkan headers was found')
	}
	os.setenv('VULKAN_SDK', sdk_root, true)
	println('\nThe Vulkan SDK installer updates VULKAN_SDK and PATH for new terminals.')
}

fn install_native() ! {
	$if linux {
		install_linux()!
	} $else $if macos {
		install_macos()!
	} $else $if windows {
		install_windows()!
	} $else {
		return error('automatic setup is not supported on this operating system')
	}
}

fn find_vulkan_header() string {
	return os.join_path(os.dir(@FILE), 'c', 'vendor', 'include', 'vulkan', 'vulkan.h')
}

fn find_volk_header() string {
	return os.join_path(os.dir(@FILE), 'c', 'vendor', 'volk', 'volk.h')
}

struct HeaderVersion {
mut:
	major int
	minor int
	patch int
}

fn (version HeaderVersion) str() string {
	return '${version.major}.${version.minor}.${version.patch}'
}

fn parse_registry_version(text string) ?HeaderVersion {
	parts := text.trim_space().trim_string_left('v').split('.')
	if parts.len != 3 {
		return none
	}
	version := HeaderVersion{
		major: parts[0].int()
		minor: parts[1].int()
		patch: parts[2].int()
	}
	if version.major == 0 || version.patch == 0 {
		return none
	}
	return version
}

fn installed_header_version(header string) ?HeaderVersion {
	core := os.read_file(os.join_path(os.dir(header), 'vulkan_core.h')) or { return none }
	mut version := HeaderVersion{
		minor: -1
	}
	for line in core.split_into_lines() {
		trimmed := line.trim_space()
		if trimmed.starts_with('#define VK_HEADER_VERSION ') {
			version.patch = trimmed.all_after('#define VK_HEADER_VERSION ').trim_space().int()
		} else if trimmed.starts_with('#define VK_HEADER_VERSION_COMPLETE VK_MAKE_API_VERSION(') {
			parts := trimmed.all_after('VK_MAKE_API_VERSION(').all_before(')').split(',')
			if parts.len == 4 {
				version.major = parts[1].trim_space().int()
				version.minor = parts[2].trim_space().int()
			}
		}
	}
	if version.major == 0 || version.minor < 0 || version.patch == 0 {
		return none
	}
	return version
}

fn (version HeaderVersion) older_than(other HeaderVersion) bool {
	if version.major != other.major {
		return version.major < other.major
	}
	if version.minor != other.minor {
		return version.minor < other.minor
	}
	return version.patch < other.patch
}

fn report_command(name string, required bool) bool {
	if path := os.find_abs_path_of_executable(name) {
		println('[ok]       ${name}: ${path}')
		return true
	}
	label := if required { 'missing' } else { 'optional' }
	println('[${label}] ${name}')
	return !required
}

fn check() bool {
	println('\nVulkan setup check')
	println('------------------')
	mut ok := true
	ok = report_command('v', true) && ok
	$if windows {
		report_command('cl', false)
	} $else {
		ok = report_command('cc', true) && ok
	}
	header := find_vulkan_header()
	if !os.is_file(header) {
		println('[missing] Bundled Vulkan header: ${header}')
		ok = false
	} else {
		println('[ok]       Bundled Vulkan header: ${header}')
		required_text := os.read_file(os.join_path(os.dir(@FILE), 'VERSION')) or { '' }
		required := parse_registry_version(required_text) or {
			println('[warning]  Could not read the binding registry version from VERSION')
			ok = false
			HeaderVersion{}
		}
		bundled := installed_header_version(header) or {
			println('[warning]  Could not determine the bundled Vulkan header version')
			ok = false
			HeaderVersion{}
		}
		if required.major > 0 && bundled.major > 0 {
			if bundled.older_than(required) {
				println('[outdated]  Bundled Vulkan headers ${bundled}; bindings use registry ${required}')
				ok = false
			} else {
				println('[ok]       Bundled Vulkan headers ${bundled} cover registry ${required}')
			}
		}
	}
	volk := find_volk_header()
	if !os.is_file(volk) || !os.is_file(os.join_path(os.dir(volk), 'volk.c')) {
		println('[missing] Bundled Volk sources: ${os.dir(volk)}')
		ok = false
	} else {
		println('[ok]       Bundled Volk sources: ${os.dir(volk)}')
	}
	if command_exists('vulkaninfo') {
		// Some SDK builds write their update manifest into the process working
		// directory. Keep diagnostics from leaving residue in the user's repo.
		result := os.execute('cd ${os.quoted_path(os.temp_dir())} && vulkaninfo --summary')
		if result.exit_code == 0 {
			println('[ok]       Vulkan loader enumerated a physical device')
		} else {
			println('[warning]  vulkaninfo is installed, but no usable device was enumerated')
			println('           Install or update the GPU vendor driver; the SDK does not provide a hardware driver.')
		}
	} else {
		println('[warning]  vulkaninfo is unavailable; SDK/loader runtime verification was skipped')
	}
	return ok
}

fn main() {
	if os.args.len > 2
		|| (os.args.len == 2 && os.args[1] !in ['--install', '--check', '-h', '--help']) {
		eprintln(usage)
		exit(2)
	}
	if os.args.len == 2 && os.args[1] in ['-h', '--help'] {
		println(usage)
		return
	}
	install := os.args.len == 1 || os.args[1] == '--install'
	if install {
		install_native() or {
			eprintln('Setup failed: ${err}')
			exit(1)
		}
		if command_exists('v') {
			run('v install antono2.vulkan') or {
				eprintln('Could not install the V module: ${err}')
				exit(1)
			}
		}
	}
	if !check() {
		eprintln('\nSetup is incomplete. Resolve the missing items above and rerun with --check.')
		exit(1)
	}
	println('\nVulkan development prerequisites are ready.')
}
