// Select the MSVC variables and PATH additions that belong in GitHub Actions receipts.
module msvcenv

import encoding.binary

const target_arch = 'x64'
const developer_command_var = 'V_MSVC_DEV_COMMAND'
const target_arch_var = 'VSCMD_ARG_TGT_ARCH'
const host_arch_var = 'VSCMD_ARG_HOST_ARCH'
const exported_variables = ['INCLUDE', 'LIB', 'LIBPATH', 'VCINSTALLDIR', 'VCToolsInstallDir',
	'VCToolsVersion', 'VCToolsRedistDir', 'VSINSTALLDIR', 'VisualStudioVersion', 'DevEnvDir',
	'WindowsSdkDir', 'WindowsSDKVersion', 'WindowsSDKLibVersion', 'WindowsSdkBinPath',
	'WindowsSdkVerBinPath', 'UniversalCRTSdkDir', 'UCRTVersion', 'ExtensionSdkDir', 'NETFXSDKDir',
	target_arch_var, host_arch_var, 'VSCMD_VER', 'CommandPromptType', 'Platform']
const utf16_bom = u16(0xfeff)
const code_unit_bytes = int(sizeof(u16))

fn environment_entry(line string, mut values map[string]string) {
	name, value := line.split_once('=') or { return }
	key := name.to_upper_ascii()
	// cmd also lists pseudo-variables for per-drive working directories.
	if key != '' && key != developer_command_var {
		values[key] = value
	}
}

fn decode_capture(raw string) !string {
	// The released V builds differ in whether they decode Windows pipe output.
	if !raw.contains('\x00') {
		return raw
	}
	if raw.len % code_unit_bytes != 0 {
		return error('The Visual Studio environment contains incomplete UTF-16.')
	}
	bytes := raw.bytes()
	mut wide := []u16{cap: bytes.len / code_unit_bytes}
	for offset := 0; offset < bytes.len; offset += code_unit_bytes {
		value := binary.little_endian_u16(bytes[offset..])
		if offset != 0 || value != utf16_bom {
			wide << value
		}
	}
	return unsafe { string_from_wide2(wide.data, wide.len) }
}

fn parse_capture(raw string) !map[string]string {
	mut values := map[string]string{}
	for line in decode_capture(raw)!.split_into_lines() {
		environment_entry(line, mut values)
	}
	return values
}

fn path_key(path string) string {
	return path.replace('/', '\\').trim_right('\\').to_lower_ascii()
}

pub struct Receipt {
pub:
	environment []string
	paths       []string
}

pub fn receipt(before map[string]string, active map[string]string, compiler_directory string) !Receipt {
	for key in [target_arch_var, host_arch_var] {
		if active[key] != target_arch {
			return error('Visual Studio did not activate the x64 host and target tools.')
		}
	}
	for key in ['PATH', 'INCLUDE', 'LIB'] {
		if active[key] == '' {
			return error('The Visual Studio environment does not contain ${key}.')
		}
	}
	mut variables := []string{}
	for exported in exported_variables {
		if value := active[exported.to_upper_ascii()] {
			variables << '${exported}=${value}'
		}
	}
	inherited := before['PATH'].split(';').map(path_key(it))
	compiler_key := path_key(compiler_directory)
	mut seen := map[string]bool{}
	mut paths := []string{}
	for folder in active['PATH'].split(';') {
		key := path_key(folder)
		if key == '' || key in seen || (key in inherited && key != compiler_key) {
			continue
		}
		seen[key] = true
		paths << folder
	}
	if compiler_key !in seen {
		return error('The resolved cl.exe directory is missing from the active Visual Studio PATH.')
	}
	for record in variables {
		if record.contains_any('\r\n') {
			return error('A Visual Studio environment variable contains a line break.')
		}
	}
	for path in paths {
		if path.contains_any('\r\n') {
			return error('A Visual Studio PATH entry contains a line break.')
		}
	}
	return Receipt{
		environment: variables
		// GitHub prepends each line, so write the directories in reverse search order.
		paths:       paths.reverse()
	}
}
