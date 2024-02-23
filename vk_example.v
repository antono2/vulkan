module main

import vulkan as vk

struct Data {
mut:
	user_data int = 123
}

fn main() {
	mut data := Data{}
	// This is vk.C.Instance = voidpointer in vulkan.v and filled in create_instance
	mut instance := unsafe { nil }

	mut create_info := vk.InstanceCreateInfo{
		s_type: vk.StructureType.structure_type_instance_create_info
		flags: 0
		p_application_info: &vk.ApplicationInfo{
			p_application_name: c'Vulkan in Vlang'
			p_engine_name: c'This is not an Engine... yet'
			api_version: vk.header_version_complete
		}
		pp_enabled_layer_names: ''.str
		enabled_layer_count: 0
		enabled_extension_count: 0
		pp_enabled_extension_names: ''.str
	}

	mut cur_result := vk.create_instance(&create_info, unsafe { nil }, &instance)

	if cur_result != vk.Result.success {
		println("Couldn't create vulkan instance. VkResult: ${cur_result}")
	}
	println('Created VkInstance ${instance}')
}
