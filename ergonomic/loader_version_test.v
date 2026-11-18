// Checks loader-version validation and the Vulkan 1.0 fallback with fake function pointers.
// No loader or device is required for these query-path regressions.
module ergonomic

import antono2.vulkan as vk

fn test_loader_api_versions_preserve_supported_values_and_refuse_zero_or_other_variants() ! {
	for version in [vk.api_version_1_0, vk.api_version_1_1, vk.api_version_1_4, vk.api_version_1_0 + 1] {
		assert validate_loader_api_version(version)! == version
	}
	for version in [u32(0), vk.api_version_1_0 - 1, vk.api_version_1_1 | (u32(1) << 29)] {
		if _ := validate_loader_api_version(version) {
			assert false
		}
	}
}

fn loader_version_ok(version &u32) vk.Result {
	unsafe { *version = vk.api_version_1_1 }
	return .success
}

fn loader_version_failure(version &u32) vk.Result {
	return .error_out_of_host_memory
}

fn loader_version_invalid(version &u32) vk.Result {
	unsafe { *version = 0 }
	return .success
}

fn test_loader_version_missing_entry_is_one_zero_but_query_errors_are_not_capability_absence() ! {
	assert query_loader_api_version(unsafe { nil })! == vk.api_version_1_0
	assert query_loader_api_version(unsafe { voidptr(loader_version_ok) })! == vk.api_version_1_1
	for pointer in [unsafe { voidptr(loader_version_failure) },
		unsafe { voidptr(loader_version_invalid) }] {
		if _ := query_loader_api_version(pointer) {
			assert false
		}
	}
}
