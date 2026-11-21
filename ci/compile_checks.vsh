// Stage an isolated Vulkan module and run the binding compiler matrix.
import os
import rand

const usage = 'Usage: v run ci/compile_checks.vsh compatibility {stable|v3|master} | source-warning {v3|master} | stage VMODULES | build-source SOURCE {v3|master} | frontend | smoke SCRATCH CC {stable|v3|master}'
const usage_status = 2
const root_files = ['vulkan.v', 'vulkan_video.v', 'loader.v', 'v.mod', 'VERSION', 'REGISTRY_COMMIT',
	'VOLK_COMMIT']
const c_files = ['loader_bridge.h', 'volk.c.v', 'volk_impl.h', 'vulkan_core_prelude.h']

fn command(program string, args []string) ! {
	mut child := os.new_process(program)
	child.set_args(args)
	child.run()
	child.wait()
	status := child.code
	child.close()
	if status != 0 {
		return error_with_code('${program} ${args.join(' ')} exited with status ${status}', status)
	}
}

fn append_actions_file(variable string, value string) ! {
	if value.contains_any('\r\n') {
		return error('Paths containing line breaks are unsupported.')
	}
	path := os.getenv(variable)
	if path != '' {
		mut file := os.open_append(path)!
		defer { file.close() }
		file.writeln(value)!
	}
}

fn compatibility(root string, profile string) ! {
	output := os.getenv('GITHUB_OUTPUT')
	if output == '' {
		return error('Set GITHUB_OUTPUT to the compatibility output file.')
	}
	script := os.join_path(root, 'scripts', 'compatibility.vsh')
	command(@VEXE, ['run', script, '--self-test'])!
	command(@VEXE, ['run', os.join_path(root, 'scripts', 'doctor.vsh'), '--self-test'])!
	command(@VEXE, ['run', script, '--profile', profile, '--github-output', output])!
}

fn stage(root string, modules string) ! {
	namespace := os.join_path(modules, 'antono2')
	target := os.join_path(namespace, 'vulkan')
	if os.exists(target) || os.is_link(target) {
		return error('Vulkan already exists at ${target}. Use a fresh isolated VMODULES directory.')
	}
	draft := os.join_path(namespace, '.vulkan-stage-' + rand.uuid_v4())
	os.mkdir_all(os.join_path(draft, 'c'))!
	defer { os.rmdir_all(draft) or {} }
	os.mkdir(os.join_path(draft, 'ergonomic'))!
	for file in root_files {
		os.cp(os.join_path(root, file), os.join_path(draft, file))!
	}
	for file in c_files {
		os.cp(os.join_path(root, 'c', file), os.join_path(draft, 'c', file))!
	}
	os.cp_all(os.join_path(root, 'c', 'vendor'), os.join_path(draft, 'c', 'vendor'), false)!
	for file in os.ls(os.join_path(root, 'ergonomic'))!.filter(it.ends_with('.v')) {
		os.cp(os.join_path(root, 'ergonomic', file), os.join_path(draft, 'ergonomic', file))!
	}
	os.rename_dir(draft, target)!
	append_actions_file('GITHUB_ENV', 'VMODULES=${modules}')!
	println('Staged Vulkan in ${target}')
}

fn build_source(source string, channel string) ! {
	// v run sets VEXE to the bootstrap binary. Make uses VEXE as its output path.
	os.unsetenv('VEXE')
	mut args := ['-C', source]
	if channel == 'v3' {
		args << 'local=1'
	}
	command('make', args)!
	command(os.join_path(source, 'v'), ['version'])!
	append_actions_file('GITHUB_PATH', source)!
}

fn v3_flags() ![]string {
	modules := os.getenv('VMODULES')
	sdk := os.getenv('VULKAN_SDK')
	if modules == '' || sdk == '' {
		return error('Set VMODULES and VULKAN_SDK before running the strict V3 checks.')
	}
	module_root := os.join_path(modules, 'antono2', 'vulkan')
	include := [os.join_path(module_root, 'c', 'vendor', 'include'),
		os.join_path(module_root, 'c', 'vendor', 'volk'), module_root, os.join_path(sdk, 'include')]
	// Strict V3 needs the include paths that the stable compiler reads from #flag.
	return ['-new-compiler', '-cflags', include.map('-I' + os.quoted_path(it)).join(' ')]
}

fn frontend(compiler string) ! {
	flags := v3_flags()!
	command(compiler, with_flags(flags, ['-check', 'generator/test/main.c.v']))!
	command(compiler, with_flags(flags, ['-check', '-d', 'vulkan_xlib', 'generator/test/main.c.v']))!
	command(compiler, with_flags(flags, ['-check', 'ci/bundled_header_smoke']))!
}

fn with_flags(flags []string, args []string) []string {
	mut invocation := flags.clone()
	invocation << args
	return invocation
}

fn smoke(compiler string, scratch string, cc string, channel string) ! {
	os.mkdir_all(scratch)!
	mut flags := ['-cc', cc]
	if channel == 'v3' {
		flags << v3_flags()!
	}
	$if macos {
		command(compiler, with_flags(flags, ['-o', os.join_path(scratch, 'vulkan-smoke'),
			'generator/test']))!
	} $else {
		command(compiler, with_flags(flags, ['run', 'generator/test']))!
	}
	command(compiler, with_flags(flags, ['-o', os.join_path(scratch, 'bundled-header-smoke'),
		'ci/bundled_header_smoke']))!
	command(compiler, with_flags(flags, ['run', 'ci/header_order_smoke']))!
	command(compiler, with_flags(flags, ['test', 'ergonomic']))!
	command(compiler, ['run', 'scripts/check_docs.vsh'])!
	command(compiler, with_flags(flags, ['-o', os.join_path(scratch, 'vulkan-first-use'),
		'examples/getting_started']))!
	command(compiler, with_flags(flags, ['-o', os.join_path(scratch, 'vulkan-conveniences'),
		'examples/conveniences']))!
	$if linux {
		if channel == 'stable' {
			command(compiler, ['-d', 'vulkan_xlib', '-cc', cc, '-o',
				os.join_path(scratch, 'vulkan-xlib-smoke'), 'ci/platform_xlib'])!
		}
	}
}

fn run(args []string) ! {
	if args in [['--help'], ['-h']] {
		println(usage)
		return
	}
	root := os.dir(@DIR)
	match true {
		args.len == 2 && args[0] == 'compatibility' && args[1] in ['stable', 'v3', 'master'] {
			compatibility(root, args[1])!
		}
		args == ['source-warning', 'v3'] {
			println('::warning::The required strict V3 frontend passed, but full V3 C compilation remains advisory.')
		}
		args == ['source-warning', 'master'] {
			println('::warning::The moving V master compatibility lane failed; stable V 0.5.2 remains authoritative.')
		}
		args.len == 2 && args[0] == 'stage' && args[1] != '' {
			stage(root, os.abs_path(args[1]))!
		}
		args.len == 3 && args[0] == 'build-source' && args[1] != '' && args[2] in ['v3', 'master'] {
			build_source(os.abs_path(args[1]), args[2])!
		}
		args == ['frontend'] {
			os.chdir(root)!
			frontend(os.find_abs_path_of_executable('v')!)!
		}
		args.len == 4 && args[0] == 'smoke' && args[1] != '' && args[2] != ''
			&& args[3] in ['stable', 'v3', 'master'] {
			scratch := os.abs_path(args[1])
			os.chdir(root)!
			smoke(os.find_abs_path_of_executable('v')!, scratch, args[2], args[3])!
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
