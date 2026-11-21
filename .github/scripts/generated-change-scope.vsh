// Enforce the file scope of a generated Vulkan bindings pull request.
import os

fn git(args []string) !string {
	mut command := ['git']
	command << args
	result := os.exec(command)
	if result.exit_code != 0 {
		return error('git ${args[0]} failed (exit ${result.exit_code}): ${result.output.trim_space()}')
	}
	return result.output
}

fn verify_scope(head string, paths []string) ! {
	if paths.len == 0 {
		return error('The generated update contains no changed files')
	}
	if !head.starts_with('generated/') {
		if 'VERSION' in paths {
			return error('VERSION may only change through a generated/* update branch')
		}
		return
	}
	for required in ['VERSION', 'REGISTRY_COMMIT'] {
		if required !in paths {
			return error('A generated update must change ${required}')
		}
	}
	for path in paths {
		header := path.ends_with('.h') && (path.starts_with('c/vendor/include/vulkan/')
			|| path.starts_with('c/vendor/include/vk_video/'))
		if !header && path !in ['VERSION', 'REGISTRY_COMMIT', 'vulkan.v', 'vulkan_video.v'] {
			printable := path.replace_each(['\r', r'\r', '\n', r'\n'])
			return error('Unexpected file in generated update: ${printable}')
		}
	}
}

fn expect_refusal(head string, paths []string, expected string) ! {
	verify_scope(head, paths) or {
		if err.msg().contains(expected) {
			return
		}
		return err
	}
	return error('Expected refusal: ${expected}')
}

fn self_test() ! {
	generated := 'generated/v1.4.369'
	verify_scope('fix/docs', ['README.md'])!
	verify_scope(generated, ['VERSION', 'REGISTRY_COMMIT', 'vulkan.v', 'vulkan_video.v',
		'c/vendor/include/vulkan/vulkan_core.h', 'c/vendor/include/vk_video/example.h'])!
	expect_refusal('fix/docs', [], 'no changed files')!
	expect_refusal('fix/docs', ['VERSION'], 'may only change')!
	expect_refusal(generated, ['REGISTRY_COMMIT'], 'must change VERSION')!
	expect_refusal(generated, ['VERSION'], 'must change REGISTRY_COMMIT')!
	expect_refusal(generated, ['VERSION', 'REGISTRY_COMMIT', 'unexpected\nfile.v'],
		r'unexpected\nfile.v')!
	println('Generated-change scope fixtures passed.')
}

fn run() ! {
	if os.args[1..] == ['--self-test'] {
		self_test()!
		return
	}
	base, head := os.getenv('BASE_REF'), os.getenv('HEAD_REF')
	if os.args.len != 1 || base == '' || head == '' {
		return error('Set BASE_REF and HEAD_REF, or pass --self-test')
	}
	git(['fetch', '--quiet', '--no-tags', 'origin', 'refs/heads/${base}'])!
	// Use NUL separators for literal file names and check both paths of a rename.
	output := git(['diff', '--name-only', '--no-ext-diff', '--no-renames', '-z', 'FETCH_HEAD...HEAD',
		'--'])!
	if output != '' && !output.ends_with('\0') {
		return error('Git did not return a NUL-terminated change list')
	}
	paths := output.trim_string_right('\0').split('\0').filter(it != '')
	verify_scope(head, paths)!
}

run() or {
	eprintln(err.msg())
	exit(1)
}
