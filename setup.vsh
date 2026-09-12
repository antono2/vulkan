#!/usr/bin/env -S v run

// Installs and verifies the native prerequisites used by antono2.vulkan.
// Running without arguments performs the installation. Use --check for a
// read-only diagnostic pass suitable for support requests and CI.

import os

const usage = 'Usage: v run setup.vsh [--install|--check]\n\n' + '  --install  Install native Vulkan development tools and this V module (default).\n' + '  --check    Only report whether the compiler, SDK/headers, loader, and device work.\n'

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
	found := os.execute('find ${os.quoted_path(unpacked)} -type f -path "*/InstallVulkan*.app/Contents/MacOS/InstallVulkan*" -print -quit')
	installer := found.output.trim_space()
	if found.exit_code != 0 || installer == '' {
		return error('the downloaded Vulkan SDK did not contain the expected macOS installer')
	}
	install_root := os.join_path(os.home_dir(), 'VulkanSDK')
	run('sudo ${os.quoted_path(installer)} --root ${os.quoted_path(install_root)} --accept-licenses --default-answer --confirm-command install com.lunarg.vulkan.core com.lunarg.vulkan.usr com.lunarg.vulkan.volk')!
}

fn install_windows() ! {
	if !command_exists('winget') {
		return error('winget is required for automatic Windows setup; install Microsoft App Installer, then try again')
	}
	run('winget install --id KhronosGroup.VulkanSDK --exact --accept-package-agreements --accept-source-agreements')!
	value := os.execute('powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable(\'VULKAN_SDK\', \'Machine\')"')
	if value.exit_code == 0 && value.output.trim_space() != '' {
		os.setenv('VULKAN_SDK', value.output.trim_space(), true)
	}
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
	mut roots := []string{}
	if sdk := os.getenv_opt('VULKAN_SDK') {
		roots << sdk
	}
	$if windows {
		if program_files := os.getenv_opt('ProgramFiles') {
			roots << os.join_path(program_files, 'VulkanSDK')
		}
	} $else {
		roots << ['/usr', '/usr/local', '/opt/homebrew']
	}
	for root in roots {
		for relative in ['include/vulkan/vulkan.h', 'Include/vulkan/vulkan.h'] {
			candidate := os.join_path(root, relative)
			if os.is_file(candidate) {
				return candidate
			}
		}
	}
	return ''
}

fn find_volk_header() string {
	mut roots := []string{}
	if sdk := os.getenv_opt('VULKAN_SDK') {
		roots << sdk
	}
	$if windows {
		if program_files := os.getenv_opt('ProgramFiles') {
			roots << os.join_path(program_files, 'VulkanSDK')
		}
	} $else {
		roots << ['/usr', '/usr/local', '/opt/homebrew']
	}
	for root in roots {
		for relative in ['include/volk.h', 'include/volk/volk.h', 'Include/volk.h',
			'Include/volk/volk.h'] {
			candidate := os.join_path(root, relative)
			if os.is_file(candidate) {
				return candidate
			}
		}
	}
	return ''
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
	if header == '' {
		println('[missing] Vulkan headers')
		ok = false
	} else {
		println('[ok]       Vulkan header: ${header}')
	}
	volk := find_volk_header()
	if volk == '' {
		println('[missing] Volk header')
		ok = false
	} else {
		println('[ok]       Volk header: ${volk}')
	}
	if command_exists('vulkaninfo') {
		result := os.execute('vulkaninfo --summary')
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
	if os.args.len > 2 || (os.args.len == 2 && os.args[1] !in ['--install', '--check', '-h', '--help']) {
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
