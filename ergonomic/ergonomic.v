module ergonomic

import antono2.vulkan as vk

// VulkanError preserves the VkResult and the operation which returned it.
// Callers can match it with `if err is ergonomic.VulkanError`.
pub struct VulkanError {
	Error
pub:
	result    vk.Result
	operation string
}

// msg implements IError without losing the original VkResult value.
pub fn (err VulkanError) msg() string {
	return '${err.operation}: ${err.result} (${int(err.result)})'
}

// is_error reports whether a VkResult is a Vulkan failure code. Positive
// statuses such as timeout and incomplete are not failures.
pub fn is_error(result vk.Result) bool {
	return int(result) < 0
}

// check converts only Vulkan failure codes to typed V errors and
// preserves success and positive status codes for the caller to inspect.
pub fn check(result vk.Result, operation string) !vk.Result {
	if is_error(result) {
		return VulkanError{
			result: result
			operation: operation
		}
	}
	return result
}

// require_success accepts only VK_SUCCESS. It is useful for operations whose
// contract does not expose a meaningful positive status to the caller.
pub fn require_success(result vk.Result, operation string) ! {
	if result != .success {
		return VulkanError{
			result: result
			operation: operation
		}
	}
}

// Instance is a lightweight wrapper around VkInstance. It does not destroy
// itself implicitly; call destroy exactly once for every successfully created
// instance.
pub struct Instance {
pub:
	handle vk.Instance
}

// new_instance initializes Volk, creates an instance with Vulkan's default
// allocator, and loads instance-level commands.
pub fn new_instance(create_info &vk.InstanceCreateInfo) !Instance {
	require_success(vk.initialize_loader(), 'volkInitialize')!
	mut handle := vk.Instance(unsafe { nil })
	require_success(vk.create_instance(create_info, unsafe { nil }, &handle), 'vkCreateInstance')!
	vk.load_instance_commands(handle)
	return Instance{
		handle: handle
	}
}

// destroy destroys an instance created by new_instance.
pub fn (instance Instance) destroy() {
	vk.destroy_instance(instance.handle, unsafe { nil })
}

// PhysicalDevice pairs a Vulkan handle with its core property snapshot.
pub struct PhysicalDevice {
pub:
	handle     vk.PhysicalDevice
	properties vk.PhysicalDeviceProperties
}

// name returns an owned V string copied from VkPhysicalDeviceProperties.
pub fn (device PhysicalDevice) name() string {
	return unsafe { cstring_to_vstring(&device.properties.deviceName[0]) }
}

// memory_properties returns an owned snapshot of the physical device's core
// memory heaps and types.
pub fn (device PhysicalDevice) memory_properties() vk.PhysicalDeviceMemoryProperties {
	mut properties := vk.PhysicalDeviceMemoryProperties{}
	vk.get_physical_device_memory_properties(device.handle, mut properties)
	return properties
}

// select_memory_type returns the first memory type which is both present in
// allowed_type_bits and contains every required property flag.
pub fn select_memory_type(properties vk.PhysicalDeviceMemoryProperties, allowed_type_bits u32, required_properties vk.MemoryPropertyFlags) ?u32 {
	for index in 0 .. int(properties.memoryTypeCount) {
		allowed := allowed_type_bits & (u32(1) << u32(index)) != 0
		flags := properties.memoryTypes[index].propertyFlags
		if allowed && flags & required_properties == required_properties {
			return u32(index)
		}
	}
	return none
}

// find_memory_type queries the physical device and returns the first memory
// type allowed by a resource's memoryTypeBits which contains every required
// property flag.
pub fn (device PhysicalDevice) find_memory_type(allowed_type_bits u32, required_properties vk.MemoryPropertyFlags) ?u32 {
	return select_memory_type(device.memory_properties(), allowed_type_bits, required_properties)
}

// QueueFamily pairs a queue-family index with its core property snapshot.
pub struct QueueFamily {
pub:
	index      u32
	properties vk.QueueFamilyProperties
}

// supports reports whether this family has at least one queue and includes all
// required queue capability bits.
pub fn (family QueueFamily) supports(required_flags vk.QueueFlags) bool {
	return family.properties.queueCount > 0
		&& family.properties.queueFlags & required_flags == required_flags
}

// select_queue_family returns the first queue family supporting every required
// flag. An empty flag mask selects the first family with an available queue.
pub fn select_queue_family(families []QueueFamily, required_flags vk.QueueFlags) ?QueueFamily {
	for family in families {
		if family.supports(required_flags) {
			return family
		}
	}
	return none
}

// queue_families returns owned snapshots of the physical device's core queue
// family properties.
pub fn (device PhysicalDevice) queue_families() []QueueFamily {
	mut count := u32(0)
	mut no_properties := unsafe { nil }
	vk.get_physical_device_queue_family_properties(device.handle, &count, mut no_properties)
	if count == 0 {
		return []QueueFamily{}
	}

	mut properties := []vk.QueueFamilyProperties{len: int(count)}
	vk.get_physical_device_queue_family_properties(device.handle, &count, mut properties[0])
	mut families := []QueueFamily{cap: int(count)}
	for index, property in properties[..int(count)] {
		families << QueueFamily{
			index: u32(index)
			properties: property
		}
	}
	return families
}

// find_queue_family discovers and selects the first family supporting every
// required queue capability bit.
pub fn (device PhysicalDevice) find_queue_family(required_flags vk.QueueFlags) ?QueueFamily {
	return select_queue_family(device.queue_families(), required_flags)
}

// Queue is a borrowed queue handle owned by its parent Device.
pub struct Queue {
pub:
	handle       vk.Queue
	family_index u32
	index        u32
}

// Device owns a logical VkDevice and exposes its single requested queue. It
// does not destroy itself implicitly; call destroy exactly once.
pub struct Device {
	physical_device PhysicalDevice
pub:
	handle vk.Device
	queue  Queue
}

// new_device creates a logical device with one queue at priority 1.0 from the
// selected family, then loads Volk's device-level commands.
//
// queue_family must have been discovered from this PhysicalDevice.
pub fn (physical_device PhysicalDevice) new_device(queue_family QueueFamily) !Device {
	if queue_family.properties.queueCount == 0 {
		return error('queue family ${queue_family.index} has no queues')
	}

	mut priority := f32(1.0)
	queue_info := vk.DeviceQueueCreateInfo{
		queueFamilyIndex: queue_family.index
		queueCount: 1
		pQueuePriorities: &priority
	}
	create_info := vk.DeviceCreateInfo{
		queueCreateInfoCount: 1
		pQueueCreateInfos: &queue_info
	}
	mut handle := vk.Device(unsafe { nil })
	require_success(vk.create_device(physical_device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateDevice')!
	vk.load_device_commands(handle)

	mut queue_handle := vk.Queue(unsafe { nil })
	vk.get_device_queue(handle, queue_family.index, 0, &queue_handle)
	return Device{
		physical_device: physical_device
		handle: handle
		queue: Queue{
			handle: queue_handle
			family_index: queue_family.index
			index: 0
		}
	}
}

// destroy destroys a logical device created by new_device. Its queue handle
// becomes invalid at the same time.
pub fn (device Device) destroy() {
	vk.destroy_device(device.handle, unsafe { nil })
}

// CommandPool owns a VkCommandPool for the queue family requested when its
// parent Device was created. The parent Device must outlive the pool.
pub struct CommandPool {
	device vk.Device
pub:
	handle             vk.CommandPool
	queue_family_index u32
	flags              vk.CommandPoolCreateFlags
}

// new_command_pool creates a command pool for the Device's queue family with
// Vulkan's default allocator.
pub fn (device Device) new_command_pool(flags vk.CommandPoolCreateFlags) !CommandPool {
	create_info := vk.CommandPoolCreateInfo{
		flags: flags
		queueFamilyIndex: device.queue.family_index
	}
	mut handle := vk.CommandPool(unsafe { nil })
	require_success(vk.create_command_pool(device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateCommandPool')!
	return CommandPool{
		device: device.handle
		handle: handle
		queue_family_index: device.queue.family_index
		flags: flags
	}
}

// reset resets the pool and every command buffer allocated from it.
pub fn (pool CommandPool) reset(flags vk.CommandPoolResetFlags) ! {
	require_success(vk.reset_command_pool(pool.device, pool.handle, flags), 'vkResetCommandPool')!
}

// PrimaryCommandBuffer is allocated from one CommandPool and retains the exact
// device and pool handles required to free it. Its raw handle remains public
// for recording and submission commands.
pub struct PrimaryCommandBuffer {
	device       vk.Device
	command_pool vk.CommandPool
pub mut:
	handle vk.CommandBuffer
}

// allocate_primary allocates count primary command buffers from the pool.
pub fn (pool CommandPool) allocate_primary(count u32) ![]PrimaryCommandBuffer {
	if count == 0 {
		return error('command buffer count must be greater than zero')
	}

	allocate_info := vk.CommandBufferAllocateInfo{
		commandPool: pool.handle
		level: .primary
		commandBufferCount: count
	}
	mut handles := unsafe { []vk.CommandBuffer{len: int(count)} }
	require_success(vk.allocate_command_buffers(pool.device, &allocate_info, handles.data), 'vkAllocateCommandBuffers')!

	mut buffers := []PrimaryCommandBuffer{cap: int(count)}
	for handle in handles {
		buffers << PrimaryCommandBuffer{
			device: pool.device
			command_pool: pool.handle
			handle: handle
		}
	}
	return buffers
}

// free returns this command buffer to the pool which allocated it and clears
// its handle. Repeated calls are harmless, but it must not be called after
// destroying the parent pool.
pub fn (mut buffer PrimaryCommandBuffer) free() {
	if isnil(buffer.handle) {
		return
	}
	vk.free_command_buffers(buffer.device, buffer.command_pool, 1, &buffer.handle)
	buffer.handle = vk.CommandBuffer(unsafe { nil })
}

// reset returns this command buffer to its initial state. Its pool must have
// been created with VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT.
pub fn (buffer PrimaryCommandBuffer) reset(flags vk.CommandBufferResetFlags) ! {
	require_success(vk.reset_command_buffer(buffer.handle, flags), 'vkResetCommandBuffer')!
}

// begin starts recording this primary command buffer. Inheritance information
// is intentionally null because it is only meaningful for secondary buffers.
pub fn (buffer PrimaryCommandBuffer) begin(flags vk.CommandBufferUsageFlags) ! {
	begin_info := vk.CommandBufferBeginInfo{
		flags: flags
		pInheritanceInfo: unsafe { nil }
	}
	require_success(vk.begin_command_buffer(buffer.handle, &begin_info), 'vkBeginCommandBuffer')!
}

// end finishes recording this command buffer.
pub fn (buffer PrimaryCommandBuffer) end() ! {
	require_success(vk.end_command_buffer(buffer.handle), 'vkEndCommandBuffer')!
}

// destroy destroys the command pool and implicitly frees every command buffer
// still allocated from it. Those wrappers must not be used afterwards.
pub fn (pool CommandPool) destroy() {
	vk.destroy_command_pool(pool.device, pool.handle, unsafe { nil })
}

// OwnedBuffer owns a VkBuffer and its bound VkDeviceMemory allocation. Both
// raw handles remain public for commands and interoperability. Destroy the
// buffer before destroying its parent Device.
pub struct OwnedBuffer {
	device vk.Device
pub:
	handle            vk.Buffer
	memory            vk.DeviceMemory
	size              vk.DeviceSize
	allocation_size   vk.DeviceSize
	memory_type_index u32
}

// new_buffer creates an exclusive-sharing buffer, selects a compatible memory
// type containing every required property, allocates memory, and binds it at
// offset zero.
pub fn (device Device) new_buffer(size vk.DeviceSize, usage vk.BufferUsageFlags, required_memory_properties vk.MemoryPropertyFlags) !OwnedBuffer {
	if size == 0 {
		return error('buffer size must be greater than zero')
	}

	create_info := vk.BufferCreateInfo{
		size: size
		usage: usage
		sharingMode: .exclusive
	}
	mut handle := vk.Buffer(unsafe { nil })
	require_success(vk.create_buffer(device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateBuffer')!

	mut requirements := vk.MemoryRequirements{}
	vk.get_buffer_memory_requirements(device.handle, handle, mut requirements)
	memory_type_index := device.physical_device.find_memory_type(requirements.memoryTypeBits, required_memory_properties) or {
		vk.destroy_buffer(device.handle, handle, unsafe { nil })
		return error('no compatible memory type for buffer')
	}

	allocate_info := vk.MemoryAllocateInfo{
		allocationSize: requirements.size
		memoryTypeIndex: memory_type_index
	}
	mut memory := vk.DeviceMemory(unsafe { nil })
	require_success(vk.allocate_memory(device.handle, &allocate_info, unsafe { nil }, &memory), 'vkAllocateMemory') or {
		vk.destroy_buffer(device.handle, handle, unsafe { nil })
		return err
	}

	require_success(vk.bind_buffer_memory(device.handle, handle, memory, 0), 'vkBindBufferMemory') or {
		vk.destroy_buffer(device.handle, handle, unsafe { nil })
		vk.free_memory(device.handle, memory, unsafe { nil })
		return err
	}

	return OwnedBuffer{
		device: device.handle
		handle: handle
		memory: memory
		size: size
		allocation_size: requirements.size
		memory_type_index: memory_type_index
	}
}

// destroy first destroys the buffer, then frees its bound memory. Call it
// exactly once for every successfully created OwnedBuffer.
pub fn (buffer OwnedBuffer) destroy() {
	vk.destroy_buffer(buffer.device, buffer.handle, unsafe { nil })
	vk.free_memory(buffer.device, buffer.memory, unsafe { nil })
}

// OwnedImage owns a two-dimensional VkImage and its bound VkDeviceMemory.
// The image uses one mip level, one array layer, and one sample.
pub struct OwnedImage {
	device vk.Device
pub:
	handle            vk.Image
	memory            vk.DeviceMemory
	format            vk.Format
	extent            vk.Extent3D
	tiling            vk.ImageTiling
	usage             vk.ImageUsageFlags
	allocation_size   vk.DeviceSize
	memory_type_index u32
}

// new_image_2d creates an exclusive-sharing 2D image, chooses memory satisfying
// all required properties, allocates it, and binds it at offset zero.
pub fn (device Device) new_image_2d(width u32, height u32, format vk.Format, tiling vk.ImageTiling,
	usage vk.ImageUsageFlags, required_memory_properties vk.MemoryPropertyFlags) !OwnedImage {
	if width == 0 || height == 0 {
		return error('image width and height must be greater than zero')
	}
	if usage == 0 {
		return error('image usage must not be empty')
	}
	extent := vk.Extent3D{
		width: width
		height: height
		depth: 1
	}
	create_info := vk.ImageCreateInfo{
		imageType: ._2d
		format: format
		extent: extent
		mipLevels: 1
		arrayLayers: 1
		samples: ._1
		tiling: tiling
		usage: usage
		sharingMode: .exclusive
		initialLayout: .undefined
	}
	mut handle := vk.Image(unsafe { nil })
	require_success(vk.create_image(device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateImage')!

	mut requirements := vk.MemoryRequirements{}
	vk.get_image_memory_requirements(device.handle, handle, mut requirements)
	memory_type_index := device.physical_device.find_memory_type(requirements.memoryTypeBits, required_memory_properties) or {
		vk.destroy_image(device.handle, handle, unsafe { nil })
		return error('no compatible memory type for image')
	}
	allocate_info := vk.MemoryAllocateInfo{
		allocationSize: requirements.size
		memoryTypeIndex: memory_type_index
	}
	mut memory := vk.DeviceMemory(unsafe { nil })
	require_success(vk.allocate_memory(device.handle, &allocate_info, unsafe { nil }, &memory), 'vkAllocateMemory') or {
		vk.destroy_image(device.handle, handle, unsafe { nil })
		return err
	}
	require_success(vk.bind_image_memory(device.handle, handle, memory, 0), 'vkBindImageMemory') or {
		vk.destroy_image(device.handle, handle, unsafe { nil })
		vk.free_memory(device.handle, memory, unsafe { nil })
		return err
	}

	return OwnedImage{
		device: device.handle
		handle: handle
		memory: memory
		format: format
		extent: extent
		tiling: tiling
		usage: usage
		allocation_size: requirements.size
		memory_type_index: memory_type_index
	}
}

// destroy first destroys the image, then frees its bound memory. Call it
// exactly once before destroying the parent Device.
pub fn (image OwnedImage) destroy() {
	vk.destroy_image(image.device, image.handle, unsafe { nil })
	vk.free_memory(image.device, image.memory, unsafe { nil })
}

// Fence owns a VkFence created by one Device. Its parent device must outlive
// it. The raw handle remains public for queue submission.
pub struct Fence {
	device vk.Device
pub mut:
	handle vk.Fence
}

// new_fence creates a fence, optionally in the signaled state.
pub fn (device Device) new_fence(signaled bool) !Fence {
	flags := if signaled { u32(vk.FenceCreateFlagBits.signaled) } else { vk.FenceCreateFlags(0) }
	create_info := vk.FenceCreateInfo{
		flags: flags
	}
	mut handle := vk.Fence(unsafe { nil })
	require_success(vk.create_fence(device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateFence')!
	return Fence{
		device: device.handle
		handle: handle
	}
}

// status returns VK_SUCCESS when signaled and VK_NOT_READY otherwise.
pub fn (fence Fence) status() !vk.Result {
	return check(vk.get_fence_status(fence.device, fence.handle), 'vkGetFenceStatus')
}

// is_signaled reports the current fence state.
pub fn (fence Fence) is_signaled() !bool {
	return fence.status()! == .success
}

// wait blocks for at most timeout nanoseconds and returns VK_SUCCESS or
// VK_TIMEOUT so callers can distinguish completion from expiration.
pub fn (fence Fence) wait(timeout u64) !vk.Result {
	return check(vk.wait_for_fences(fence.device, 1, &fence.handle, vk.Bool32(1), timeout), 'vkWaitForFences')
}

// reset returns the fence to the unsignaled state.
pub fn (fence Fence) reset() ! {
	require_success(vk.reset_fences(fence.device, 1, &fence.handle), 'vkResetFences')!
}

// destroy releases the fence and clears its handle. Repeated calls are
// harmless, but the parent Device must still be alive.
pub fn (mut fence Fence) destroy() {
	if isnil(fence.handle) {
		return
	}
	vk.destroy_fence(fence.device, fence.handle, unsafe { nil })
	fence.handle = vk.Fence(unsafe { nil })
}

// Semaphore owns a binary VkSemaphore created by one Device. Its raw handle
// remains public for submission and presentation structures.
pub struct Semaphore {
	device vk.Device
pub mut:
	handle vk.Semaphore
}

// new_semaphore creates a core binary semaphore.
pub fn (device Device) new_semaphore() !Semaphore {
	create_info := vk.SemaphoreCreateInfo{}
	mut handle := vk.Semaphore(unsafe { nil })
	require_success(vk.create_semaphore(device.handle, &create_info, unsafe { nil }, &handle), 'vkCreateSemaphore')!
	return Semaphore{
		device: device.handle
		handle: handle
	}
}

// destroy releases the semaphore and clears its handle. Repeated calls are
// harmless, but the parent Device must still be alive.
pub fn (mut semaphore Semaphore) destroy() {
	if isnil(semaphore.handle) {
		return
	}
	vk.destroy_semaphore(semaphore.device, semaphore.handle, unsafe { nil })
	semaphore.handle = vk.Semaphore(unsafe { nil })
}

// physical_devices performs Vulkan's count/fill enumeration pattern and
// retries when the available device set changes and VK_INCOMPLETE is returned.
pub fn (instance Instance) physical_devices() ![]PhysicalDevice {
	for {
		mut count := u32(0)
		require_success(vk.enumerate_physical_devices(instance.handle, &count, unsafe {
			nil
		}), 'vkEnumeratePhysicalDevices(count)')!
		if count == 0 {
			return []PhysicalDevice{}
		}

		mut handles := unsafe { []vk.PhysicalDevice{len: int(count)} }
		result := vk.enumerate_physical_devices(instance.handle, &count, handles.data)
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkEnumeratePhysicalDevices(values)')!

		mut devices := []PhysicalDevice{cap: int(count)}
		for handle in handles[..int(count)] {
			mut properties := vk.PhysicalDeviceProperties{}
			vk.get_physical_device_properties(handle, mut properties)
			devices << PhysicalDevice{
				handle: handle
				properties: properties
			}
		}
		return devices
	}
	return []PhysicalDevice{}
}
