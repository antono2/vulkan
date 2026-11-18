// Resolve tested compiler and module pins and validate the VPM declarations.
import flag
import json
import os
import rand
import x.json2

fn name_is_safe(name string) bool {
	return name.len > 0 && name.bytes().all((it >= `a` && it <= `z`) || it.is_digit() || it == `_`)
}

fn release_is_valid(version string) bool {
	parts := version.split('.')
	return parts.len == 3 && parts.all(it.len > 0 && it.bytes().all(it.is_digit()))
}

fn manifest(path string) !map[string]json2.Any {
	return json2.decode[map[string]json2.Any](os.read_file(path)!)
}

fn pin_value(pins map[string]json2.Any, key string) string {
	value := pins[key] or { return '' }
	return value.str()
}

fn resolve(root string, profile string) !map[string]string {
	pins := manifest(os.join_path(root, 'compatibility.json'))!
	if (pins['schema_version'] or { json2.Any(0) }).int() != 1 {
		return error('Unsupported compatibility schema_version')
	}
	if 'v_release' in pins && !release_is_valid(pin_value(pins, 'v_release')) {
		return error('v_release must be a released compiler version')
	}
	upstream := os.join_path(root, 'third_party', 'upstream.json')
	if os.is_file(upstream) {
		native := manifest(upstream)!
		if pin_value(pins, 'glfw') != pin_value(native, 'version') {
			return error('Native GLFW version and compatibility.json disagree')
		}
	}

	mut outputs := map[string]string{}
	for key, value in pins {
		if key in ['v', 'vc', 'tcc', 'volk', 'generator'] || key.ends_with('_v')
			|| key.ends_with('_vc') || key.ends_with('_tcc') {
			commit := value.str()
			if commit.len != 40 || !commit.bytes().all(it.is_digit() || (it >= `a` && it <= `f`)) {
				return error('${key} must be an immutable Git commit')
			}
		}
		if value is string {
			outputs[key] = value
		}
	}
	modules := (pins['modules'] or { json2.Any(map[string]json2.Any{}) }).as_map()
	declarations := os.read_file(os.join_path(root, 'v.mod'))!.split("'")
	for i := 1; i < declarations.len; i += 2 {
		declaration := declarations[i]
		if declaration.starts_with('antono2.') && declaration.contains('@') {
			name := declaration.all_after('antono2.').all_before('@')
			if name_is_safe(name) && pin_value(modules, name) != declaration.all_after('@') {
				return error('v.mod and compatibility.json disagree for ${name}')
			}
		}
	}
	for name, value in modules {
		tag := value.str()
		version := if tag.ends_with('-standard') { tag[..tag.len - '-standard'.len] } else { tag }
		if !name_is_safe(name) || !version.starts_with('v') || !release_is_valid(version[1..]) {
			return error('Invalid module pin: ${name}=${tag}')
		}
		outputs['module_' + name] = tag
	}
	outputs['selected_v'] = match profile {
		'stable' {
			if 'v' in outputs { outputs['v'] } else { outputs['v_release'] }
		}
		'master' {
			'master'
		}
		'v3' {
			outputs['v3_v'] or { return error('v3 profile requires v3_v') }
		}
		else {
			return error('unknown compatibility profile: ${profile}')
		}
	}

	for key, value in outputs {
		if !name_is_safe(key) || value.contains_any('\r\n') {
			return error('Unsafe compatibility output: ${key}')
		}
	}
	return outputs
}

fn revision(checkout string, ref string) !string {
	return os.execute_opt('git -C ${os.quoted_path(checkout)} rev-parse --verify ${os.quoted_path(ref)}')!.output.trim_space()
}

fn verify_modules(outputs map[string]string, modules string) ! {
	for key, tag in outputs {
		if !key.starts_with('module_') {
			continue
		}
		checkout := os.join_path(modules, 'antono2', key['module_'.len..])
		if revision(checkout, 'HEAD')! != revision(checkout, 'refs/tags/${tag}^{commit}')! {
			return error('Installed module does not match ${tag}: ${checkout}')
		}
	}
}

fn expect_invalid(root string, expected string) ! {
	resolve(root, 'stable') or {
		if !err.msg().contains(expected) {
			return error('expected ${expected}, got ${err}')
		}
		return
	}
	return error('accepted a fixture that should fail with ${expected}')
}

fn self_test(root string) ! {
	pins := manifest(os.join_path(root, 'compatibility.json'))!
	expected := if 'v' in pins { pin_value(pins, 'v') } else { pin_value(pins, 'v_release') }
	assert resolve(root, 'stable')!['selected_v'] == expected
	assert resolve(root, 'master')!['selected_v'] == 'master'
	if 'v3_v' in pins {
		assert resolve(root, 'v3')!['selected_v'] == pin_value(pins, 'v3_v')
	}
	work := os.join_path(os.temp_dir(), 'compatibility ${rand.uuid_v4()}')
	os.mkdir(work)!
	defer { os.rmdir_all(work) or {} }
	os.write_file(os.join_path(work, 'v.mod'),
		"Module { dependencies: ['antono2.memory@v99.0.0'] }")!
	path := os.join_path(work, 'compatibility.json')
	os.write_file(path, '{"schema_version":1,"v":"master"}')!
	expect_invalid(work, 'immutable')!
	os.write_file(path, '{"schema_version":1,"modules":{"memory":"v1.4.0"}}')!
	expect_invalid(work, 'disagree')!
	os.write_file(os.join_path(work, 'v.mod'), 'Module {}')!
	os.write_file(path, '{"schema_version":1,"v_release":"0.5.2","ci_sdk":"x\\nother=pin"}')!
	expect_invalid(work, 'Unsafe compatibility output')!
	println('Compatibility profiles and refusal checks passed.')
}

fn run_cli() ! {
	mut parser := flag.new_flag_parser(os.args[1..])
	parser.application('compatibility')
	parser.description('Validate and resolve tested build profiles.')
	root := parser.string('root', 0, os.dir(@DIR), 'project root')
	profile := parser.string('profile', 0, 'stable', 'stable, v3, or master')
	output_path := parser.string('github-output', 0, '', 'append pins to this GitHub output file')
	key := parser.string('get', 0, '', 'print a single pin')
	modules := parser.string('modules', 0, '', 'verify module checkouts in this directory')
	test := parser.bool('self-test', 0, false, 'run the profile and refusal fixtures')
	if parser.bool('help', `h`, false, 'show help') {
		println(parser.usage())
		return
	}
	if parser.finalize()!.len != 0 {
		return error('unexpected positional arguments')
	}
	if test {
		self_test(root)!
		return
	}
	outputs := resolve(root, profile)!
	if modules != '' {
		verify_modules(outputs, modules)!
	}
	if output_path != '' {
		mut output := os.open_append(output_path)!
		defer { output.close() }
		for name, value in outputs {
			output.writeln('${name}=${value}')!
		}
	}
	if key != '' {
		println(outputs[key] or { return error('unknown compatibility output: ${key}') })
	} else {
		println(json.encode_pretty(outputs))
	}
}

run_cli() or {
	eprintln(err)
	exit(1)
}
