// Validate a tagged Vulkan package and create its GitHub release when absent.
import os
import v.vmod

const version_component_count = 3 // major, minor, patch

fn release_title(version string, tag string, registry string) !string {
	parts := version.split('.')
	if parts.len != version_component_count || !parts.all(it.len > 0
		&& it.bytes().all(it.is_digit())) {
		return error('Invalid package version: ${version}')
	}
	if tag != 'v${version}' {
		return error('Expected tag v${version} for the Vulkan package, got ${tag}')
	}
	registry_version := registry.replace_each(['\r', '', '\n', ''])
	return 'antono2.vulkan ${tag} (registry ${registry_version})'
}

fn self_test() ! {
	assert release_title('3.4.0', 'v3.4.0', 'v1.4.369\r\n')! == 'antono2.vulkan v3.4.0 (registry v1.4.369)'
	for version in ['', '3.4', '3.4.0-preview'] {
		if _ := release_title(version, 'v${version}', 'v1.4.369') {
			return error('Accepted invalid package version: ${version}')
		}
	}
	if _ := release_title('3.4.0', 'v3.4.1', 'v1.4.369') {
		return error('Accepted a mismatched release tag')
	}
	println('Package release metadata fixtures passed.')
}

fn run() ! {
	args := os.args[1..]
	if args == ['--self-test'] {
		self_test()!
		return
	}
	if args.len != 0 {
		return error('Usage: v run .github/scripts/package-release.vsh [--self-test]')
	}
	tag := os.getenv('GITHUB_REF_NAME')
	manifest := vmod.from_file('v.mod')!
	title := release_title(manifest.version, tag, os.read_file('VERSION')!)!
	existing := os.exec(['gh', 'release', 'view', tag])
	if existing.exit_code == 0 {
		return
	}
	created := os.exec(['gh', 'release', 'create', tag, '--verify-tag', '--generate-notes', '--title',
		title])
	if created.exit_code != 0 {
		return error('Could not create the release (exit ${created.exit_code}): ${created.output.trim_space()}')
	}
	print(created.output)
}

run() or {
	eprintln(err.msg())
	exit(1)
}
