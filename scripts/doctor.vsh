// Read-only build and runtime diagnostics. Use --json for a support report.
import flag
import os
import rand
import strings
import time
import x.json2

const command_timeout = 15 * time.second
const runtime_timeout = 30 * time.second
const probe_interval = 10 * time.millisecond
const require_explicit_v3_pin = false

struct Options {
	compiler string
	modules  string
	sdk      string
	runtime  bool
	profile  string = 'stable'
}

struct Check {
	name   string
	status string
	detail string
	action string
}

struct Report {
	project       string
	platform      string
	profile       string
	compatibility map[string]json2.Any
	checks        []Check
	hardware_note string
}

struct ProbeResult {
	ok     bool
	detail string
}

struct Probes {
	find fn (string) string = find_executable
	run  fn (string, []string, time.Duration) ProbeResult = run_probe
}

fn find_executable(name string) string {
	if os.is_abs_path(name) && os.is_file(name) && os.is_executable(name) {
		return name
	}
	path := os.find_abs_path_of_executable(name) or { return '' }
	return if os.is_file(path) && os.is_executable(path) { path } else { '' }
}

fn run_probe(executable string, args []string, timeout time.Duration) ProbeResult {
	path := find_executable(executable)
	if path == '' {
		return ProbeResult{
			detail: 'Executable unavailable: ${executable}'
		}
	}
	mut child := os.new_process(path)
	child.set_args(args)
	child.set_redirect_stdio()
	child.run()
	defer { child.close() }
	mut stdout := strings.new_builder(256)
	mut stderr := strings.new_builder(256)
	timer := time.new_stopwatch()
	for {
		live := child.is_alive()
		out := child.stdout_read()
		err := child.stderr_read()
		stdout.write_string(out)
		stderr.write_string(err)
		if !live && out == '' && err == '' {
			child.wait()
			break
		}
		if timer.elapsed() >= timeout {
			if live {
				child.signal_kill()
				// wait() reaps a killed POSIX child only from a running status.
				child.status = .running
				child.wait()
			}
			return ProbeResult{
				detail: 'Timed out after ${timeout}: ${executable}'
			}
		}
		if out == '' && err == '' {
			time.sleep(probe_interval)
		}
	}
	detail := (stdout.str() + stderr.str()).replace('\r\n', '\n').trim_space()
	return ProbeResult{
		ok:     child.code == 0
		detail: if detail == '' { child.err } else { detail }
	}
}

fn make_check(name string, passed bool, detail string, action string, optional bool) Check {
	return Check{
		name:   name
		status: if passed {
			'pass'
		} else if optional {
			'warn'
		} else {
			'fail'
		}
		detail: detail
		action: if passed { '' } else { action }
	}
}

fn load_pins(root string) !map[string]json2.Any {
	pins :=
		json2.decode[map[string]json2.Any](os.read_file(os.join_path(root, 'compatibility.json'))!)!
	version := pins['schema_version'] or { return error('Missing schema_version') }
	if version.int() != 1 {
		return error('Unsupported schema_version')
	}
	return pins
}

fn pin(pins map[string]json2.Any, name string) string {
	value := pins[name] or { return '' }
	return value.str()
}

fn expected_compiler(pins map[string]json2.Any, profile string) string {
	selected := match profile {
		'release' {
			pin(pins, 'v_release')
		}
		'v3' {
			if 'v3_v' in pins || require_explicit_v3_pin {
				pin(pins, 'v3_v')
			} else {
				pin(pins, 'v')
			}
		}
		else {
			pin(pins, 'v')
		}
	}

	if selected == '' && profile == 'stable' {
		return pin(pins, 'v_release')
	}
	return selected[..if selected.len < 7 {
		selected.len
	} else {
		7
	}]
}

fn mismatched_modules(root string, pins map[string]json2.Any) ![]string {
	declarations := os.read_file(os.join_path(root, 'v.mod'))!.split("'")
	mut declared := map[string]string{}
	for i := 1; i < declarations.len; i += 2 {
		value := declarations[i]
		if value.starts_with('antono2.') && value.contains('@') {
			name := value.all_after('antono2.').all_before('@')
			tag := value.all_after('@')
			if name != '' && tag != '' && name.bytes().all((it >= `a` && it <= `z`)
				|| it.is_digit() || it == `_`) {
				declared[name] = tag
			}
		}
	}
	return declared.keys().filter(declared[it] != pin(pins, it))
}

fn diagnose(root string, options Options, probes Probes) Report {
	pins := load_pins(root) or {
		return Report{
			checks: [
				make_check('Compatibility manifest', false, err.msg(),
					'Restore compatibility.json from this project revision.', false),
			]
		}
	}
	module_pins := (pins['modules'] or { json2.Any(map[string]json2.Any{}) }).as_map()
	mut checks := []Check{}
	disagreement := mismatched_modules(root, module_pins) or {
		checks << make_check('Declared dependencies', false, err.msg(),
			'Restore v.mod from this project revision.', false)
		[]string{}
	}
	if checks.len == 0 {
		checks << make_check('Declared dependencies', disagreement.len == 0, if disagreement.len == 0 {
			'Manifest agrees with v.mod'
		} else {
			disagreement.join(', ')
		}, 'Update compatibility.json and v.mod together; use the tested dependency versions.',
			false)
	}
	tools :=
		(pins['build_tools'] or { json2.Any([json2.Any('git'), json2.Any('cmake')]) }).as_array()
	for tool in tools {
		name := tool.str()
		location := probes.find(name)
		checks << make_check(name, location != '', if location == '' {
			'Not found on PATH'
		} else {
			location
		}, 'Install ${name}, reopen your shell and rerun diagnostics.', false)
	}

	if options.compiler == '' {
		checks << make_check('V compiler', false, 'No V compiler found',
			'Run the project setup helper, or pass --v with the tested compiler path.', false)
	} else {
		version := probes.run(options.compiler, ['-version'], command_timeout)
		expected := expected_compiler(pins, options.profile)
		action := if require_explicit_v3_pin && expected == '' {
			'Configure the requested compiler profile in compatibility.json.'
		} else {
			'Select the tested V compiler from compatibility.json; pass --v with its executable path.'
		}
		checks << make_check('V compiler', version.ok && expected != ''
			&& version.detail.contains(expected), version.detail, action, false)
	}

	if options.modules == '' {
		checks << make_check('Installed modules', false, 'VMODULES is not set',
			'Pass --modules with the module directory used by setup.', true)
	} else {
		for name, value in module_pins {
			checkout := os.join_path(options.modules, 'antono2', name)
			tag := value.str()
			git_args := ['-C', checkout, 'rev-parse', '--verify']
			head := probes.run('git', array_with_arg(git_args, 'HEAD'), command_timeout)
			wanted := probes.run('git', array_with_arg(git_args, 'refs/tags/${tag}^{commit}'),
				command_timeout)
			checks << make_check('Module ' + name, head.ok && wanted.ok
				&& head.detail == wanted.detail, '${checkout}: expected ${tag}',
				'Preserve local changes and use a fresh module/cache directory with the declared releases.',
				false)
		}
	}

	needs_vulkan := 'ci_sdk' in pins || 'vulkan' in module_pins
	$if windows {
		if needs_vulkan {
			available := options.sdk != ''
				&& os.is_file(os.join_path(options.sdk, 'Lib', 'vulkan-1.lib'))
			checks << make_check('Vulkan SDK', available, if options.sdk == '' {
				'Not configured'
			} else {
				options.sdk
			}, 'Install the Vulkan SDK or pass --sdk with its directory.', false)
		}
	}
	if options.runtime && needs_vulkan {
		mut executable := probes.find('vulkaninfo')
		if executable == '' && options.sdk != '' {
			$if windows {
				executable = probes.find(os.join_path(options.sdk, 'Bin', 'vulkaninfo.exe'))
			} $else {
				executable = probes.find(os.join_path(options.sdk, 'bin', 'vulkaninfo'))
			}
		}
		result := if executable == '' {
			ProbeResult{
				detail: 'vulkaninfo is unavailable'
			}
		} else {
			probes.run(executable, ['--summary'], runtime_timeout)
		}
		checks << make_check('Vulkan devices', result.ok, result.detail,
			'Install Vulkan runtime tools and a compatible graphics driver; rerun --runtime.', true)
	}
	return Report{
		project:       os.file_name(root)
		platform:      if os.user_os() == 'windows' { 'nt' } else { 'posix' }
		profile:       options.profile
		compatibility: pins
		checks:        checks
		hardware_note: 'Device enumeration does not validate hardware video decoding or OpenCL interoperability.'
	}
}

fn array_with_arg(args []string, trailing string) []string {
	mut complete := args.clone()
	complete << trailing
	return complete
}

fn self_test() ! {
	root := os.join_path(os.temp_dir(), 'doctor ' + rand.uuid_v4())
	os.mkdir(root)!
	defer { os.rmdir_all(root) or {} }
	manifest := os.join_path(root, 'compatibility.json')
	declarations := os.join_path(root, 'v.mod')
	pins := '{"schema_version":1,"v":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","modules":{"memory":"v1.4.0"},"build_tools":["git"]}'
	contents := "Module { dependencies: ['antono2.memory@v1.4.0'] }"
	os.write_file(manifest, pins)!
	os.write_file(declarations, contents)!
	missing := diagnose(root, Options{}, Probes{
		find: fn (_ string) string {
			return ''
		}
	})
	failed := missing.checks.filter(it.status == 'fail')
	assert failed.map(it.name) == ['git', 'V compiler']
	assert failed.all(it.action != '')
	assert os.read_file(manifest)! == pins
	assert os.read_file(declarations)! == contents
	assert os.ls(root)!.len == 2

	os.write_file(declarations, contents.replace('v1.4.0', 'v99.0.0'))!
	known := Probes{
		find: fn (name string) string {
			return name
		}
		run:  fn (_ string, _ []string, _ time.Duration) ProbeResult {
			return ProbeResult{
				ok:     true
				detail: 'V bbbbbbb'
			}
		}
	}
	wrong := diagnose(root, Options{ compiler: 'fixture-v' }, known)
	assert wrong.checks.filter(it.status == 'fail').map(it.name) == [
		'Declared dependencies',
		'V compiler',
	]
	os.write_file(declarations, contents)!
	os.write_file(manifest, pins.replace('"modules"',
		'"v3_v":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb","modules"'))!
	assert diagnose(root, Options{ compiler: 'fixture-v', profile: 'v3' }, known).checks.filter(it.status == 'fail').len == 0
	assert diagnose(root, Options{ compiler: 'fixture-v', profile: 'release' }, known).checks.filter(it.status == 'fail').map(it.name) == [
		'V compiler',
	]
	assert expected_compiler(json2.decode[map[string]json2.Any](pins)!, 'v3') == if require_explicit_v3_pin {
		''
	} else {
		'aaaaaaa'
	}

	// Exercise the real process plumbing with the current executable.
	child := run_probe(os.executable(), ['--probe-fixture'], command_timeout)
	assert child.ok && child.detail == 'stdout\nstderr'
	timed := run_probe(os.executable(), ['--probe-fixture', 'wait'], 100 * time.millisecond)
	assert !timed.ok && timed.detail.starts_with('Timed out')
	println('Build and runtime diagnostic checks passed.')
}

fn environment_or(option string, name string) string {
	return if option == '' { os.getenv(name) } else { option }
}

fn run_cli() ! {
	mut parser := flag.new_flag_parser(os.args[1..])
	parser.application('doctor')
	parser.description('Check compiler, native tools and runtime availability.')
	explicit_compiler := parser.string('v', 0, '', 'tested V compiler executable')
	modules := parser.string('modules', 0, '', 'module directory')
	sdk := parser.string('sdk', 0, '', 'Vulkan SDK directory')
	profile := parser.string('profile', 0, 'stable', 'stable, v3, or release')
	runtime := parser.bool('runtime', 0, false, 'enumerate Vulkan devices when tools are available')
	json_output := parser.bool('json', 0, false, 'write a JSON support report')
	self_test_only := parser.bool('self-test', 0, false, 'run the diagnostic fixtures')
	if parser.bool('help', `h`, false, 'show help') {
		println(parser.usage())
		return
	}
	if parser.finalize()!.len != 0 || profile !in ['stable', 'v3', 'release'] {
		return error_with_code('Expected --profile stable, v3, or release. See --help.', 2)
	}
	if self_test_only {
		self_test()!
		return
	}
	compiler := environment_or(explicit_compiler, 'VEXE')
	report := diagnose(os.dir(@DIR), Options{
		compiler: if compiler == '' { find_executable('v') } else { compiler }
		modules:  environment_or(modules, 'VMODULES')
		sdk:      environment_or(sdk, 'VULKAN_SDK')
		profile:  profile
		runtime:  runtime
	}, Probes{})
	if json_output {
		if report.project == '' {
			println(json2.encode({
				'checks': report.checks
			}, prettify: true))
		} else {
			println(json2.encode(report, prettify: true))
		}
	} else {
		for check in report.checks {
			println('${check.status.to_upper()}: ${check.name}: ${check.detail}')
			if check.action != '' {
				println('  Next: ${check.action}')
			}
		}
	}
	if report.checks.any(it.status == 'fail') {
		exit(1)
	}
}

if os.args.len >= 2 && os.args[1] == '--probe-fixture' {
	if os.args.len == 3 {
		time.sleep(3 * time.second)
	}
	println('stdout')
	eprintln('stderr')
	exit(0)
}
run_cli() or {
	eprintln(err)
	exit(if err.code() == 2 { 2 } else { 1 })
}
