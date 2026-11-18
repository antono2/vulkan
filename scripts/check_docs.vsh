// Check that README examples are exact copies of the sources exercised by CI.
import os

fn check_examples(root string) !int {
	mut readme := os.join_path(root, 'packaging', 'published_README.md')
	if !os.is_file(readme) {
		readme = os.join_path(root, 'README.md')
	}
	lines := os.read_file(readme)!.replace('\r\n', '\n').split_into_lines()
	mut index := 0
	mut checked := 0
	for index < lines.len {
		line := lines[index].trim_space()
		index++
		if !line.starts_with('<!-- example: ') {
			continue
		}
		if !line.ends_with(' -->') {
			return error('invalid example marker: ${line}')
		}
		path := line['<!-- example: '.len..line.len - ' -->'.len].trim_space()
		for index < lines.len && lines[index].trim_space() == '' {
			index++
		}
		if index == lines.len || lines[index].trim_space() != '```v' {
			return error('missing V code fence for ${path}')
		}
		index++
		start := index
		for index < lines.len && lines[index].trim_space() != '```' {
			index++
		}
		if index == lines.len {
			return error('unclosed V code fence for ${path}')
		}
		example := os.read_file(os.join_path(root, path))!.replace('\r\n', '\n')
		if lines[start..index].join('\n').trim_space() != example.trim_space() {
			return error('README example drift: ${path}')
		}
		index++
		checked++
	}
	if checked == 0 {
		return error('README needs a tested first-use example')
	}
	return checked
}

checked := check_examples(os.dir(@DIR)) or {
	eprintln(err)
	exit(1)
}
println('${checked} README example(s) match tested source.')
