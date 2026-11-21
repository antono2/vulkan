// Run the Linux SDK, lifecycle, and window regressions used by Vulkan CI.
import os

const usage = 'Usage: v run ci/linux_checks.vsh old-headers SCRATCH | lifecycle SCRATCH CC | presentation SCRATCH GLFW_CHECKOUT'
const usage_status = 2
const validation_layer = 'VK_LAYER_KHRONOS_validation'
// Emulate an SDK with Vulkan 1.3.275 headers, older than the bundled registry.
const obsolete_core_header = '#define VK_HEADER_VERSION 275\n#define VK_HEADER_VERSION_COMPLETE VK_MAKE_API_VERSION(0, 1, 3, VK_HEADER_VERSION)\n'

fn execute(args []string, log string) !string {
	result := os.exec(args)
	if log != '' {
		os.write_file(log, result.output)!
	}
	print(result.output)
	if result.exit_code != 0 {
		return error('${args.join(' ')} exited with status ${result.exit_code}')
	}
	return result.output
}

fn validated(args []string, log string) ! {
	diagnostics := execute(args, log)!.to_lower_ascii()
	if ['validation error', 'validation warning', 'vuid-'].any(diagnostics.contains(it)) {
		return error('Vulkan validation reported a problem. See ${log}.')
	}
}

fn old_headers(root string, scratch string) ! {
	sdk := os.join_path(scratch, 'old-vulkan-sdk')
	include := os.join_path(sdk, 'include')
	os.mkdir_all(os.join_path(include, 'vulkan'))!
	os.mkdir_all(os.join_path(include, 'volk'))!
	os.write_file(os.join_path(include, 'vulkan', 'vulkan.h'), '')!
	os.write_file(os.join_path(include, 'volk', 'volk.h'), '')!
	os.write_file(os.join_path(include, 'vulkan', 'vulkan_core.h'), obsolete_core_header)!
	os.setenv('VULKAN_SDK', sdk, true)
	diagnostics := execute([@VEXE, 'run', os.join_path(root, 'setup.vsh'), '--check'], os.join_path(scratch,
		'old-header-check.log'))!
	version := os.read_file(os.join_path(root, 'VERSION'))!.trim_space().trim_string_left('v')
	if !diagnostics.contains('Bundled Vulkan headers ${version} cover registry ${version}') {
		return error('The SDK check did not confirm that bundled headers cover registry ${version}.')
	}
}

fn lifecycle(root string, scratch string, compiler string) ! {
	os.setenv('VK_INSTANCE_LAYERS', validation_layer, true)
	for example, log in {
		'conveniences':        'conveniences.log'
		'ergonomic_lifecycle': 'vulkan-lifecycle.log'
	} {
		validated([@VEXE, '-cc', compiler, 'run', os.join_path(root, 'examples', example)], os.join_path(scratch,
			log))!
	}
}

fn presentation(root string, scratch string, glfw string) ! {
	modules := os.getenv('VMODULES')
	if modules == '' || !os.is_file(os.join_path(glfw, 'v.mod')) {
		return error('Set VMODULES to the isolated module directory and pass a GLFW checkout.')
	}
	namespace := os.join_path(modules, 'antono2')
	destination := os.join_path(namespace, 'glfw')
	if os.exists(destination) || os.is_link(destination) {
		return error('GLFW already exists at ${destination}. Use a fresh isolated VMODULES directory.')
	}
	os.mkdir_all(namespace)!
	os.cp_all(glfw, destination, false)!
	binary := os.join_path(scratch, 'presentation')
	window_check := os.join_path(scratch, 'window-startup-check')
	execute([@VEXE, '-cc', 'gcc', '-o', binary, os.join_path(root, 'examples', 'presentation')], '')!
	execute([@VEXE, '-cc', 'tcc', '-o', window_check,
		os.join_path(root, 'tests', 'desktop', 'window_startup.v')], '')!
	execute([window_check, binary, os.join_path(scratch, 'window-startup-logs'), '--startup-only'],
		'')!
	os.setenv('VK_INSTANCE_LAYERS', validation_layer, true)
	validated(['xvfb-run', '-a', binary], os.join_path(scratch, 'presentation.log'))!
}

fn run(args []string) ! {
	if args in [['--help'], ['-h']] {
		println(usage)
		return
	}
	if args.len < 2 || args[1..].any(it == '') {
		return error_with_code(usage, usage_status)
	}
	root := os.dir(@DIR)
	scratch := os.abs_path(args[1])
	os.mkdir_all(scratch)!
	match true {
		args[0] == 'old-headers' && args.len == 2 {
			old_headers(root, scratch)!
		}
		args[0] == 'lifecycle' && args.len == 3 {
			lifecycle(root, scratch, args[2])!
		}
		args[0] == 'presentation' && args.len == 3 {
			presentation(root, scratch, os.abs_path(args[2]))!
		}
		else {
			return error_with_code(usage, usage_status)
		}
	}
}

run(os.args[1..]) or {
	eprintln(err.msg())
	exit(if err.code() > 0 { err.code() } else { 1 })
}
