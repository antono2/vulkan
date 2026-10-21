// Lists Vulkan devices through the ergonomic instance owner with explicit cleanup.
// Requires a Vulkan loader and device, but no window or shaders.
module main

import antono2.vulkan.ergonomic as vke

fn main() {
	run() or {
		eprintln(err)
		exit(1)
	}
}

fn run() ! {
	mut instance := vke.new_instance_with_options(vke.InstanceOptions{
		application_name: 'Vulkan first use'
	})!
	defer { instance.destroy() }
	devices := instance.physical_devices()!
	if devices.len == 0 { return error('Vulkan runtime found, but no devices were enumerated') }
	for device in devices {
		println(device.name())
	}
}
