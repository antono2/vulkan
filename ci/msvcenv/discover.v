// Discover and capture the x64 environment produced by Visual Studio's developer script.
module msvcenv

import os
import rand
import strings
import time

const discovery_timeout = 2 * time.minute
const command_poll = 10 * time.millisecond

fn captured(program string, args []string, directory string, environment map[string]string) !string {
	mut child := os.new_process(program)
	defer { child.close() }
	child.set_args(args)
	child.set_work_folder(directory)
	child.set_environment(environment)
	child.set_redirect_stdio()
	child.run()
	mut output := strings.new_builder(512)
	timer := time.new_stopwatch()
	for {
		running := child.is_alive()
		chunk := child.stdout_read()
		stderr := child.stderr_read()
		output.write_string(chunk)
		if !running && chunk == '' && stderr == '' {
			child.wait()
			break
		}
		if timer.elapsed() >= discovery_timeout {
			child.signal_kill()
			child.status = .running
			child.wait()
			return error('${os.file_name(program)} timed out while discovering Visual Studio.')
		}
		if chunk == '' && stderr == '' {
			time.sleep(command_poll)
		}
	}
	if child.code != 0 {
		// The capture can contain inherited environment values. Keep stdout out of logs.
		return error('${os.file_name(program)} exited with status ${child.code} while discovering Visual Studio.')
	}
	return output.str()
}

fn locate_compiler(path string) !string {
	for folder in path.split(';') {
		if folder != '' && os.is_file(os.join_path(folder, 'cl.exe')) {
			return folder
		}
	}
	return error('The active Visual Studio environment has no cl.exe.')
}

fn discover(before map[string]string) !map[string]string {
	if before[target_arch_var] == target_arch && before[host_arch_var] == target_arch {
		if _ := locate_compiler(before['PATH']) {
			return before
		}
	}
	program_files := before['PROGRAMFILES(X86)']
	if program_files == '' {
		return error('ProgramFiles(x86) is unset. Use a 64-bit Windows shell.')
	}
	vswhere := os.join_path(program_files, 'Microsoft Visual Studio', 'Installer', 'vswhere.exe')
	if !os.is_file(vswhere) {
		return error('Visual Studio Installer is unavailable: ${vswhere}')
	}
	installation := captured(vswhere, ['-latest', '-products', '*', '-requires',
		'Microsoft.VisualStudio.Component.VC.Tools.x86.x64', '-property', 'installationPath', '-utf8'], '', before)!.trim_space()
	if installation == '' {
		return error('Visual Studio x64 C++ tools were not found. Install the Desktop development with C++ workload.')
	}
	devcmd := os.join_path(installation, 'Common7', 'Tools', 'VsDevCmd.bat')
	if !os.is_file(devcmd) {
		return error('The Visual Studio developer command is missing: ${devcmd}')
	}
	command := before['COMSPEC']
	if command == '' || !os.is_file(command) {
		return error('ComSpec must locate cmd.exe for the Visual Studio developer command.')
	}
	scratch := os.join_path(os.temp_dir(), 'v-msvc-' + rand.uuid_v4())
	os.mkdir(scratch)!
	defer { os.rmdir_all(scratch) or { eprintln(err) } }
	script := 'capture.cmd'
	// Use a fixed script name and a quoted environment reference for installations with spaces.
	os.write_file(os.join_path(scratch, script), '@echo off\r\n' +
		'call "%${developer_command_var}%" -no_logo -arch=${target_arch} -host_arch=${target_arch} >nul\r\n' +
		'if errorlevel 1 exit /b 1\r\nset\r\n')!
	mut child_env := before.clone()
	child_env[developer_command_var] = devcmd
	return parse_capture(captured(command, ['/d', '/u', '/c', script], scratch, child_env)!)
}

pub fn configure() !Receipt {
	$if windows {
		before := windows_environment()!
		active := discover(before)!
		return receipt(before, active, locate_compiler(active['PATH'])!)
	} $else {
		return error('MSVC discovery requires Windows.')
	}
}
