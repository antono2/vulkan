module main

import vulkan as vk

fn main() {
	// Use this to unload the vulkan shared library symbols
	defer {
		(*vk.loader_p).unregister()
	}

	mut instance := unsafe { nil }

	create_info := vk.InstanceCreateInfo{
		s_type: vk.StructureType.structure_type_instance_create_info
		flags: 0
		p_application_info: &vk.ApplicationInfo{
			p_application_name: c'Vulkan in Vlang'
			p_engine_name: c'This is not an Engine... yet'
			api_version: vk.header_version_complete
		}
		pp_enabled_layer_names: ''.str
		enabled_layer_count: 0
		pp_enabled_extension_names: ''.str
		enabled_extension_count: 0
	}

	result := vk.create_instance(&create_info, unsafe { nil }, &instance)

	if result != vk.Result.success {
		println("Couldn't create vulkan instance. VkResult: ${result}")
	} else {
		println('Created VkInstance ${instance}')
	}
}
