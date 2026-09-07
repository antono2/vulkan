# Ergonomic Vulkan API

The generated `vulkan.v` and `vulkan_video.v` files remain the complete, low-level API. Hand-written conveniences live in the opt-in `antono2.vulkan.ergonomic` submodule so registry regeneration cannot overwrite them and existing programs do not change behavior.

## Conventions

- Raw Vulkan handles remain available through a public `handle` field. Wrappers do not hide escape hatches needed for extensions or interoperability.
- A negative `VkResult` becomes a typed `VulkanError` containing both the original result and the operation name. `check` preserves non-negative statuses; `require_success` enforces exact success where that is the operation's contract.
- Constructors return V results (`!T`) and perform required loader/dispatch setup.
- Vulkan objects use explicit `destroy()` methods. There are no implicit finalizers, and each successfully created owned object must be destroyed exactly once.
- Two-call enumerations return V arrays and internally retry `VK_INCOMPLETE`.
- Generated names and signatures are never edited to improve ergonomics. New wrappers compose them from the submodule.

## Discovery, device, buffer, and command slices

The first slice covers loader initialization, default-allocator instance creation and destruction, physical-device enumeration, core property snapshots, and owned device-name strings. The second slice adds queue-family discovery and selection by required `QueueFlags`, plus logical-device creation with one priority-1.0 queue. The third slice adds memory-type selection and buffers which own their bound device-memory allocation. The fourth slice adds owned command pools and primary command buffers:

```v
import antono2.vulkan as vk
import antono2.vulkan.ergonomic as vke

app := vk.ApplicationInfo{
	pApplicationName: c'my app'
	apiVersion: vk.api_version_1_0
}
info := vk.InstanceCreateInfo{
	pApplicationInfo: &app
}
instance := vke.new_instance(&info)!
defer {
	instance.destroy()
}
physical_device := instance.physical_devices()![0]
required := u32(vk.QueueFlagBits.graphics) | u32(vk.QueueFlagBits.compute)
queue_family := physical_device.find_queue_family(required) or {
	return error('no graphics/compute queue family')
}
device := physical_device.new_device(queue_family)!
defer {
	device.destroy()
}
usage := u32(vk.BufferUsageFlagBits.vertex_buffer) | u32(vk.BufferUsageFlagBits.transfer_dst)
memory_properties := u32(vk.MemoryPropertyFlagBits.device_local)
buffer := device.new_buffer(4096, usage, memory_properties)!
defer {
	buffer.destroy()
}
pool_flags := u32(vk.CommandPoolCreateFlagBits.reset_command_buffer)
pool := device.new_command_pool(pool_flags)!
defer {
	pool.destroy()
}
mut command_buffer := pool.allocate_primary(1)![0]
defer {
	command_buffer.free()
}
command_buffer.begin(u32(vk.CommandBufferUsageFlagBits.one_time_submit))!
// Record commands with command_buffer.handle.
command_buffer.end()!
mut fence := device.new_fence(false)!
defer {
	fence.destroy()
}
mut image_ready := device.new_semaphore()!
defer {
	image_ready.destroy()
}
// Submit using fence.handle and image_ready.handle.
println('${physical_device.name()}: queue family ${device.queue.family_index}')
```

`Queue` is borrowed from its parent `Device` and becomes invalid when that device is destroyed. `OwnedBuffer` exposes its raw buffer and memory handles, requested size, allocation size, and selected memory-type index. Its `destroy()` method always destroys the buffer before freeing its memory; callers must destroy every buffer before destroying the parent device. `PhysicalDevice.find_memory_type()` applies both the resource's allowed-memory-type bit mask and the complete required property mask.

`CommandPool` belongs to its parent `Device` and is fixed to that device's selected queue-family index. `PrimaryCommandBuffer` retains the exact device and pool handles needed by `free()`, while its public raw `handle` remains available for recording and submission. `free()` is idempotent and clears that raw handle. Reset, begin, and end failures are returned as typed `VulkanError` values. Destroying a command pool implicitly frees and invalidates all command buffers still allocated from it; callers may either free buffers explicitly before pool destruction or rely on that Vulkan lifetime rule, but must never use or free a buffer after its pool is destroyed. Every command pool must be destroyed before its parent device.

`Fence` exposes status, timeout-aware waiting, and reset while preserving positive Vulkan statuses such as `VK_NOT_READY` and `VK_TIMEOUT`. `Fence` and `Semaphore` expose their raw handles for submission structures, clear those handles during idempotent destruction, and must be destroyed before their parent device.

`OwnedImage` creates a simple exclusive-sharing 2D image with one mip level, one array layer, and one sample. It exposes the raw image and memory handles plus its format, extent, tiling, usage, allocation size, and selected memory type. Destruction releases the image before its bound allocation, and must happen before destroying the parent device. More specialized image creation remains available through the raw layer.

Custom allocation callbacks, concurrent-sharing buffers, queue priorities other than 1.0, enabled features, and device extensions deliberately remain in the raw layer for now. A future configurable owning wrapper must retain the allocator used at creation so the same callbacks are supplied during destruction.

## Next slices

1. Instance extension and layer enumeration with owned V strings.
2. Presentation-support selection layered onto the core queue-flag helper.
3. Configurable queue requests, extension validation, and enabled features.
4. Owned fences and binary semaphores with explicit parent ownership and destruction ordering. (Implemented.)
5. Owned 2D images with explicit parent ownership and destruction ordering. (Implemented.)
6. Builders only where they eliminate unsafe pointer/count bookkeeping; Vulkan synchronization and memory choices should remain explicit.
