// Activate the Visual Studio x64 toolchain for later GitHub Actions steps.
import msvcenv
import os

const usage = 'Usage: v run ci/setup_msvc.vsh (requires GITHUB_ENV and GITHUB_PATH)'
const usage_status = 2

fn append(path string, lines []string) ! {
	mut file := os.open_append(path)!
	defer { file.close() }
	for line in lines {
		file.writeln(line)!
	}
}

fn run(args []string) ! {
	if args in [['-h'], ['--help']] {
		println(usage)
		return
	}
	environment := os.getenv('GITHUB_ENV')
	path := os.getenv('GITHUB_PATH')
	if args.len != 0 || environment == '' || path == '' {
		return error_with_code(usage, usage_status)
	}
	configuration := msvcenv.configure()!
	append(environment, configuration.environment)!
	append(path, configuration.paths)!
	println('MSVC x64 compiler, SDK variables, and tool paths are ready for later steps.')
}

run(os.args[1..]) or {
	eprintln(err)
	exit(if err.code() > 0 { err.code() } else { 1 })
}
