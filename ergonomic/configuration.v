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

// DeviceQueueRequest requests consecutive queues from one family. Each
// priority maps to the queue at the same zero-based index in that family.
pub struct DeviceQueueRequest {
pub:
	queue_family QueueFamily
	priorities   []f32 = [f32(1.0)]
}

// DeviceOptions configures logical-device queues together with device
// extensions, core features, and an optional feature pNext chain.
//
// queue_family, queue_index, and queue_priority preserve the original
// single-queue API. Set queue_requests to request queues from one or more
// families; it cannot be combined with those legacy fields. The first queue
// in queue_requests becomes Device.queue.
pub struct DeviceOptions {
pub:
	queue_family     QueueFamily
	queue_index      u32
	queue_priority   f32 = 1.0
	queue_requests   []DeviceQueueRequest
	extensions       []string
	enabled_features &vk.PhysicalDeviceFeatures = unsafe { nil }
	p_next           voidptr = unsafe { nil }
}

struct DeviceQueuePlan {
	requests             []DeviceQueueRequest
	primary_family_index u32
	primary_queue_index  u32
}

fn validate_device_queue_request(request DeviceQueueRequest) ! {
	if request.queue_family.properties.queueCount == 0 {
		return error('queue family ${request.queue_family.index} has no queues')
	}
	if request.priorities.len == 0 {
		return error('queue family ${request.queue_family.index} must request at least one queue')
	}
	if request.priorities.len > int(request.queue_family.properties.queueCount) {
		return error('requested ${request.priorities.len} queues from family ${request.queue_family.index}, which exposes ${request.queue_family.properties.queueCount}')
	}
	for queue_index, priority in request.priorities {
		// Express this as an accepted range so NaN is rejected as well.
		if !(priority >= 0.0 && priority <= 1.0) {
			return error('queue priority for family ${request.queue_family.index} index ${queue_index} must be between 0.0 and 1.0')
		}
	}
}

fn device_queue_plan(options DeviceOptions) !DeviceQueuePlan {
	if options.queue_requests.len == 0 {
		if options.queue_family.properties.queueCount == 0 {
			return error('queue family ${options.queue_family.index} has no queues')
		}
		if options.queue_index >= options.queue_family.properties.queueCount {
			return error('queue index ${options.queue_index} is outside queue family ${options.queue_family.index}')
		}
		if !(options.queue_priority >= 0.0 && options.queue_priority <= 1.0) {
			return error('queue priority must be between 0.0 and 1.0')
		}

		// Vulkan creates queues consecutively from index zero. Request every
		// index through the selected legacy queue so vkGetDeviceQueue never
		// targets a queue which was not created.
		priorities := []f32{len: int(options.queue_index) + 1, init: options.queue_priority}
		return DeviceQueuePlan{
			requests: [
				DeviceQueueRequest{
					queue_family: options.queue_family
					priorities: priorities
				},
			]
			primary_family_index: options.queue_family.index
			primary_queue_index: options.queue_index
		}
	}

	if options.queue_family.properties.queueCount != 0 || options.queue_index != 0
		|| options.queue_priority != 1.0 {
		return error('queue_requests cannot be combined with queue_family, queue_index, or queue_priority')
	}

	mut seen_families := map[u32]bool{}
	for request in options.queue_requests {
		validate_device_queue_request(request)!
		if seen_families[request.queue_family.index] {
			return error('queue family ${request.queue_family.index} is requested more than once')
		}
		seen_families[request.queue_family.index] = true
	}
	return DeviceQueuePlan{
		requests: options.queue_requests.clone()
		primary_family_index: options.queue_requests[0].queue_family.index
		primary_queue_index: 0
	}
}

// new_device_with_options validates queue requests and device extensions,
// then creates a logical device while retaining all temporary priority and
// pointer arrays through vkCreateDevice.
pub fn (physical_device PhysicalDevice) new_device_with_options(options DeviceOptions) !Device {
	queue_plan := device_queue_plan(options)!
	available_extensions := extension_names(physical_device.extensions()!)
	validate_requested_names('device extensions', options.extensions, available_extensions)!

	mut extension_pointers := []&char{cap: options.extensions.len}
	for extension in options.extensions {
		extension_pointers << extension.str
	}
	mut priority_groups := [][]f32{cap: queue_plan.requests.len}
	for request in queue_plan.requests {
		priority_groups << request.priorities.clone()
	}
	mut queue_infos := []vk.DeviceQueueCreateInfo{cap: queue_plan.requests.len}
	for request_index, request in queue_plan.requests {
		queue_infos << vk.DeviceQueueCreateInfo{
			queueFamilyIndex: request.queue_family.index
			queueCount: u32(priority_groups[request_index].len)
			pQueuePriorities: priority_groups[request_index].data
		}
	}
	create_info := vk.DeviceCreateInfo{
		pNext: options.p_next
		queueCreateInfoCount: u32(queue_infos.len)
		pQueueCreateInfos: queue_infos.data
		enabledExtensionCount: u32(extension_pointers.len)
		ppEnabledExtensionNames: extension_pointers.data
		pEnabledFeatures: options.enabled_features
	}
	mut handle := vk.Device(unsafe { nil })
	require_success(vk.create_device(physical_device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateDevice')!
	vk.load_device_commands(handle)

	mut queues := []Queue{}
	mut primary_queue := Queue{}
	for request in queue_plan.requests {
		for queue_index in 0 .. request.priorities.len {
			mut queue_handle := vk.Queue(unsafe { nil })
			vk.get_device_queue(handle, request.queue_family.index, u32(queue_index), &queue_handle)
			queue := Queue{
				device: handle
				handle: queue_handle
				family_index: request.queue_family.index
				index: u32(queue_index)
			}
			queues << queue
			if queue.family_index == queue_plan.primary_family_index
				&& queue.index == queue_plan.primary_queue_index {
				primary_queue = queue
			}
		}
	}
	return Device{
		physical_device: physical_device
		handle: handle
		queue: primary_queue
		queues: queues
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
