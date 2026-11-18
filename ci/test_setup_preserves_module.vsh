// Exercise installation with fake package commands and an existing release pin.
import os
import rand

fn check_existing_pin() ! {
	work := os.join_path(os.temp_dir(), 'vulkan pinned module ${rand.uuid_v4()}')
	os.mkdir(work)!
	defer { os.rmdir_all(work) or {} }
	modules := os.join_path(work, 'modules')
	package := os.join_path(modules, 'antono2', 'vulkan')
	os.mkdir_all(package)!
	manifest := os.join_path(package, 'v.mod')
	pin := "Module { name: 'antono2.vulkan' version: '1.2.3' }\n"
	os.write_file(manifest, pin)!
	source := os.join_path(work, 'fixture.v')
	os.write_file(source, "import os
fn main() {
	if os.file_name(os.executable()) == 'v' {
		os.write_file(os.getenv('INSTALL_MARKER'), os.args.join(' ')) or { panic(err) }
		exit(88)
	}
}
")!
	stub := os.join_path(work, 'sudo')
	compiler := os.quoted_path(@VEXE)
	os.execute_opt('${compiler} -cc gcc -o ${os.quoted_path(stub)} ${os.quoted_path(source)}')!
	os.cp(stub, os.join_path(work, 'v'))!
	os.chmod(os.join_path(work, 'v'), 0o755)!
	marker := os.join_path(work, 'unexpected-install.txt')
	os.setenv('VMODULES', modules, true)
	os.setenv('PATH', work + os.path_delimiter + os.getenv('PATH'), true)
	os.setenv('INSTALL_MARKER', marker, true)
	setup := os.join_path(os.dir(@DIR), 'setup.vsh')
	os.execute_opt('${compiler} run ${os.quoted_path(setup)} --install')!
	if os.exists(marker) {
		return error('setup attempted an unpinned module install')
	}
	if os.read_file(manifest)! != pin {
		return error('setup changed the existing module pin')
	}
}

if os.user_os() != 'linux' {
	eprintln('Linux package-command fixture only')
	exit(2)
}
check_existing_pin() or {
	eprintln(err)
	exit(1)
}
println('Existing module pin preserved; package commands were mocked.')
