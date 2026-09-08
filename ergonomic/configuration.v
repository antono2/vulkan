module ergonomic

import antono2.vulkan as vk

// InstanceOptions owns the V strings used to assemble an InstanceCreateInfo.
// p_next may point to an application-owned feature structure which must remain
// alive until new_instance_with_options returns.
pub struct InstanceOptions {
pub:
	application_name    string = 'V application'
	application_version u32
	engine_name         string
	engine_version      u32
	api_version         u32 = vk.api_version_1_0
	flags               vk.InstanceCreateFlags
	layers              []string
	extensions          []string
	p_next              voidptr = unsafe { nil }
}

// new_instance_with_options validates requested layers and extensions, owns
// their temporary C pointer arrays, and creates a loader-ready instance.
pub fn new_instance_with_options(options InstanceOptions) !Instance {
	available_extensions := extension_names(instance_extensions()!)
	validate_requested_names('instance extensions', options.extensions, available_extensions)!
	available_layers := layer_names(instance_layers()!)
	validate_requested_names('instance layers', options.layers, available_layers)!

	mut layer_pointers := []&char{cap: options.layers.len}
	for layer in options.layers {
		layer_pointers << layer.str
	}
	mut extension_pointers := []&char{cap: options.extensions.len}
	for extension in options.extensions {
		extension_pointers << extension.str
	}
	application := vk.ApplicationInfo{
		pApplicationName: options.application_name.str
		applicationVersion: options.application_version
		pEngineName: options.engine_name.str
		engineVersion: options.engine_version
		apiVersion: options.api_version
	}
	create_info := vk.InstanceCreateInfo{
		pNext: options.p_next
		flags: options.flags
		pApplicationInfo: &application
		enabledLayerCount: u32(layer_pointers.len)
		ppEnabledLayerNames: layer_pointers.data
		enabledExtensionCount: u32(extension_pointers.len)
		ppEnabledExtensionNames: extension_pointers.data
	}
	return new_instance(&create_info)
}

// DeviceOptions configures the single queue exposed by Device together with
// device extensions, core features, and an optional feature pNext chain.
pub struct DeviceOptions {
pub:
	queue_family     QueueFamily
	queue_index      u32
	queue_priority   f32 = 1.0
	extensions       []string
	enabled_features &vk.PhysicalDeviceFeatures = unsafe { nil }
	p_next           voidptr = unsafe { nil }
}

// new_device_with_options validates the queue request and device extensions,
// then creates a logical device while retaining all temporary pointer arrays
// through vkCreateDevice.
pub fn (physical_device PhysicalDevice) new_device_with_options(options DeviceOptions) !Device {
	if options.queue_family.properties.queueCount == 0 {
		return error('queue family ${options.queue_family.index} has no queues')
	}
	if options.queue_index >= options.queue_family.properties.queueCount {
		return error('queue index ${options.queue_index} is outside queue family ${options.queue_family.index}')
	}
	if options.queue_priority < 0.0 || options.queue_priority > 1.0 {
		return error('queue priority must be between 0.0 and 1.0')
	}
	available_extensions := extension_names(physical_device.extensions()!)
	validate_requested_names('device extensions', options.extensions, available_extensions)!

	mut extension_pointers := []&char{cap: options.extensions.len}
	for extension in options.extensions {
		extension_pointers << extension.str
	}
	priority := options.queue_priority
	queue_info := vk.DeviceQueueCreateInfo{
		queueFamilyIndex: options.queue_family.index
		queueCount: 1
		pQueuePriorities: &priority
	}
	create_info := vk.DeviceCreateInfo{
		pNext: options.p_next
		queueCreateInfoCount: 1
		pQueueCreateInfos: &queue_info
		enabledExtensionCount: u32(extension_pointers.len)
		ppEnabledExtensionNames: extension_pointers.data
		pEnabledFeatures: options.enabled_features
	}
	mut handle := vk.Device(unsafe { nil })
	require_success(vk.create_device(physical_device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateDevice')!
	vk.load_device_commands(handle)

	mut queue_handle := vk.Queue(unsafe { nil })
	vk.get_device_queue(handle, options.queue_family.index, options.queue_index, &queue_handle)
	return Device{
		physical_device: physical_device
		handle: handle
		queue: Queue{
			handle: queue_handle
			family_index: options.queue_family.index
			index: options.queue_index
		}
	}
}

// supports_presentation checks whether a queue family can present to surface.
pub fn (device PhysicalDevice) supports_presentation(family QueueFamily, surface vk.SurfaceKHR) !bool {
	if isnil(surface) {
		return error('presentation surface must not be null')
	}
	mut supported := vk.Bool32(0)
	require_success(vk.get_physical_device_surface_support_khr(device.handle, family.index, surface, &supported), 'vkGetPhysicalDeviceSurfaceSupportKHR')!
	return supported != 0
}

// find_present_queue_family selects the first queue family which has all
// required queue flags and supports presentation to surface.
pub fn (device PhysicalDevice) find_present_queue_family(required_flags vk.QueueFlags, surface vk.SurfaceKHR) !QueueFamily {
	for family in device.queue_families() {
		if family.supports(required_flags) && device.supports_presentation(family, surface)! {
			return family
		}
	}
	return error('no queue family supports the requested flags and presentation surface')
}
