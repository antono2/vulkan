// Report loader support before selecting an instance API version.
module ergonomic

import antono2.vulkan as vk

// Query through the loader's exported address, not a possibly null 1.1 command.
// A 1.0 loader legitimately has no vkEnumerateInstanceVersion entry point.
pub fn loader_api_version() !u32 {
	require_success(vk.initialize_loader(), 'volkInitialize(loader version)')!
	address := vk.get_instance_proc_addr(vk.Instance(unsafe { nil }), c'vkEnumerateInstanceVersion')
	return query_loader_api_version(address)
}

fn query_loader_api_version(address voidptr) !u32 {
	if isnil(address) {
		return vk.api_version_1_0
	}
	query := unsafe { vk.PFN_vkEnumerateInstanceVersion(address) }
	mut version := u32(0)
	require_success(query(&version), 'vkEnumerateInstanceVersion')!
	return validate_loader_api_version(version)
}

fn validate_loader_api_version(version u32) !u32 {
	if version < vk.api_version_1_0 || version >> 29 != 0 {
		return error('unsupported Vulkan loader API version')
	}
	return version
}
