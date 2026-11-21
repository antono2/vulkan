// Copy Windows' UTF-16 environment before launching child tools.
module msvcenv

#include <windows.h>

fn C.GetEnvironmentStringsW() &u16
fn C.FreeEnvironmentStringsW(&u16) i32

fn windows_environment() !map[string]string {
	block := C.GetEnvironmentStringsW()
	if isnil(block) {
		return error('Could not read the Windows process environment.')
	}
	defer { C.FreeEnvironmentStringsW(block) }
	mut values := map[string]string{}
	// Advance by UTF-16 code units, rather than the length of the converted UTF-8 text.
	mut cursor := unsafe { &u16(block) }
	unsafe {
		for *cursor != 0 {
			mut length := 0
			for cursor[length] != 0 {
				length++
			}
			environment_entry(string_from_wide2(cursor, length), mut values)
			cursor += length + 1
		}
	}
	return values
}
