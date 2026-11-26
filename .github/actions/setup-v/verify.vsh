// Verify compiler/bootstrap checkouts before exposing the tested toolchain.
import os
import x.json2

fn checked(args []string) !string {
	result := os.exec(args)
	if result.exit_code != 0 { return error(result.output) }
	return result.output.trim_space()
}

fn run() ! {
	root := os.real_path(os.join_path(@DIR, '..', '..', '..'))
	pins := json2.decode[map[string]json2.Any](os.read_file(os.join_path(root, 'toolchain.json'))!)!
	if (pins['schema_version'] or { json2.null }).int() != 1 {
		return error('Unknown toolchain schema')
	}
	compiler := os.real_path(@VEXE)
	compiler_root := os.dir(compiler)
	tcc_key := $if windows { 'windows_tcc' } $else $if macos {
		$if arm64 {
			'macos_arm64_tcc'
		} $else {
			'macos_x64_tcc'
		}
	} $else { 'linux_tcc' }
	for directory, key in {
		compiler_root:                                    'v'
		os.join_path(compiler_root, 'vc'):                'vc'
		os.join_path(compiler_root, 'thirdparty', 'tcc'): tcc_key
	} {
		expected := (pins[key] or { return error('Missing ${key}') }).str()
		actual := checked(['git', '-C', directory, 'rev-parse', 'HEAD'])!
		if expected != actual { return error('${key}: expected ${expected}, got ${actual}') }
		checked(['git', '-C', directory, 'diff', '--quiet'])!
		checked(['git', '-C', directory, 'diff', '--cached', '--quiet'])!
		println('${key}: ${actual}')
	}
	version := checked([compiler, 'version'])!
	if !version.contains((pins['v'] or { json2.null }).str()[..7]) {
		return error('Compiler binary does not match its checkout: ${version}')
	}
	println(version)
	if destination := os.getenv_opt('GITHUB_OUTPUT') {
		mut output := os.open_append(destination)!
		output.writeln('root=${compiler_root}')!
		output.writeln('exe=${compiler}')!
		output.writeln('revision=' + pins['v']!.str())!
		output.close()
	}
	if destination := os.getenv_opt('GITHUB_PATH') {
		mut output := os.open_append(destination)!
		output.writeln(compiler_root)!
		output.close()
	}
}

run() or {
	eprintln(err)
	exit(1)
}
