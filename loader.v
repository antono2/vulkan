module vulkan

fn C.v_vulkan_initialize_loader() Result

// initialize_loader loads the Vulkan loader and populates the global commands.
// Call this before create_instance().
pub fn initialize_loader() Result {
	return C.v_vulkan_initialize_loader()
}

// load_instance_commands populates commands that are scoped to an instance.
// Call this immediately after successfully creating an instance.
pub fn load_instance_commands(instance Instance) {
	C.volkLoadInstance(instance)
}

// load_device_commands populates commands that are scoped to a device.
// Call this immediately after successfully creating a device.
pub fn load_device_commands(device Device) {
	C.volkLoadDevice(device)
}
