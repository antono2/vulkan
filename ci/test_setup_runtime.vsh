// Exercise the setup runtime probe with a synthetic vulkaninfo executable.
import flag
import os
import rand

const probe_source = "import os
fn main() {
	assert os.args[1..] == ['--summary']
	assert os.real_path(os.getwd()) == os.real_path(os.temp_dir())
	os.write_file(os.getenv('PROBE_MARKER'), os.getwd()) or { panic(err) }
	if os.getenv('PROBE_FAIL') == '1' { exit(23) }
	println('GPU0: fixture')
}
"

fn invoke(compiler string, args []string) !string {
	mut command := [compiler]
	command << args
	result := os.execute(command.map(os.quoted_path(it)).join(' '))
	if result.exit_code != 0 {
		return error('command failed (${result.exit_code}): ${result.output}')
	}
	return result.output
}

fn run_cli() ! {
	mut parser := flag.new_flag_parser(os.args[1..])
	parser.application('test_setup_runtime')
	parser.description('Check runtime diagnostics using a fixture executable.')
	vexe := os.getenv('VEXE')
	v_arg := parser.string('v', 0, if vexe == '' { @VEXE } else { vexe }, 'V compiler executable')
	cc := parser.string('cc', 0, if os.user_os() == 'windows' { 'msvc' } else { 'gcc' },
		'C compiler')
	if parser.bool('help', `h`, false, 'show help') {
		println(parser.usage())
		return
	}
	if parser.finalize()!.len != 0 {
		return error('unexpected positional arguments')
	}
	compiler := if os.is_abs_path(v_arg) && os.is_file(v_arg) {
		v_arg
	} else {
		os.find_abs_path_of_executable(v_arg)!
	}
	root := os.dir(@DIR)
	os.chdir(root)!
	work := os.join_path(os.temp_dir(), 'vulkan setup with spaces ' + rand.uuid_v4())
	os.mkdir(work)!
	defer { os.rmdir_all(work) or {} }
	source := os.join_path(work, 'probe.v')
	os.write_file(source, probe_source)!
	suffix := if os.user_os() == 'windows' { '.exe' } else { '' }
	probe := os.join_path(work, 'vulkaninfo' + suffix)
	invoke(compiler, ['-cc', cc, '-o', probe, source])!
	marker := os.join_path(work, 'ran.txt')
	os.setenv('PATH', work + os.path_delimiter + os.getenv('PATH'), true)
	os.setenv('PROBE_MARKER', marker, true)
	for i, expected in [
		'[ok]       Vulkan loader enumerated a physical device',
		'[warning]  vulkaninfo is installed, but no usable device was enumerated',
	] {
		os.setenv('PROBE_FAIL', i.str(), true)
		output := invoke(compiler, ['-cc', cc, '-o', os.join_path(work, 'setup' + suffix),
			'run', os.join_path(root, 'setup.vsh'), '--check'])!
		print(output)
		assert os.is_file(marker), 'vulkaninfo never ran'
		assert output.contains(expected), output
		os.rm(marker)!
	}
	println('Setup runtime probe tests passed.')
}

run_cli() or {
	eprintln(err)
	exit(1)
}
