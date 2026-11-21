module msvcenv

fn utf16le(text string) string {
	mut encoded := []u8{}
	for character in text.runes() {
		code_unit := u16(character)
		encoded << [u8(code_unit), u8(code_unit >> 8)]
	}
	return encoded.bytestr()
}

fn test_capture_preserves_unicode_and_values_with_equals() ! {
	text := '${target_arch_var}=x64\r\n=Z:=Z:\\work\r\n' +
		'Path=C:\\Outils café\\bin\r\nINCLUDE=C:\\SDK=dev\\include\r\n' +
		'${developer_command_var}=fixture.cmd\r\n'
	for raw in [text, utf16le('${rune(utf16_bom)}${text}')] {
		values := parse_capture(raw)!
		assert values['PATH'] == r'C:\Outils café\bin'
		assert values['INCLUDE'] == r'C:\SDK=dev\include'
		assert values.len == 3
	}
}

fn test_receipt_keeps_tool_precedence_and_ignores_inherited_variables() ! {
	before := {
		'PATH': r'C:\System;C:\MSVC\bin;C:\V'
	}
	active := {
		'PATH':          r'C:\MSVC\bin;C:\Dev SDK\bin;c:/system;C:\V;C:\DEV SDK\BIN'
		'INCLUDE':       r'C:\MSVC\include;C:\Dev SDK\include'
		'LIB':           r'C:\Dev SDK\lib'
		target_arch_var: target_arch
		host_arch_var:   target_arch
		'GITHUB_OUTPUT': 'existing.txt'
		'CUSTOM_DATA':   'not part of MSVC setup'
	}
	result := receipt(before, active, r'C:\MSVC\bin')!
	assert result.paths == [r'C:\Dev SDK\bin', r'C:\MSVC\bin']
	assert result.environment == [
		r'INCLUDE=C:\MSVC\include;C:\Dev SDK\include',
		r'LIB=C:\Dev SDK\lib',
		'${target_arch_var}=${target_arch}',
		'${host_arch_var}=${target_arch}',
	]
}

fn test_receipt_refuses_wrong_target_and_multiline_records() ! {
	mut active := {
		'PATH':          r'C:\MSVC\bin'
		'INCLUDE':       r'C:\MSVC\include'
		'LIB':           r'C:\MSVC\lib'
		target_arch_var: 'x86'
		host_arch_var:   target_arch
	}
	for field, value in {
		target_arch_var: 'x86'
		'INCLUDE':       'first\nSECOND=unexpected'
		'PATH':          'C:\\MSVC\\bin;bad\npath'
	} {
		previous := active[field]
		active[field] = value
		receipt({}, active, r'C:\MSVC\bin') or {
			assert err.msg().contains(if field == target_arch_var { 'x64' } else { 'line break' })
			active[field] = if field == target_arch_var { target_arch } else { previous }
			continue
		}
		assert false, 'Expected to reject ${field}'
	}
}
