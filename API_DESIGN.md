# Ergonomic Vulkan API

The generated `vulkan.v` and `vulkan_video.v` files remain the complete, low-level API. Hand-written conveniences live in the opt-in `antono2.vulkan.ergonomic` submodule so registry regeneration cannot overwrite them and existing programs do not change behavior.

## Conventions

- Raw Vulkan handles remain available through a public `handle` field. Wrappers do not hide escape hatches needed for extensions or interoperability.
- A negative `VkResult` becomes a typed `VulkanError` containing both the original result and the operation name. `check` preserves non-negative statuses; `require_success` enforces exact success where that is the operation's contract.
- Constructors return V results (`!T`) and perform required loader/dispatch setup.
- Vulkan objects use explicit `destroy()` methods. There are no implicit finalizers, and each successfully created owned object must be destroyed exactly once.
- Two-call enumerations return V arrays and internally retry `VK_INCOMPLETE`.
- Generated names and signatures are never edited to improve ergonomics. New wrappers compose them from the submodule.

## Discovery, device, and buffer slices

The first slice covers loader initialization, default-allocator instance creation and destruction, physical-device enumeration, core property snapshots, and owned device-name strings. The second slice adds queue-family discovery and selection by required `QueueFlags`, plus logical-device creation with one priority-1.0 queue. The third slice adds memory-type selection and buffers which own their bound device-memory allocation:

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
println('${physical_device.name()}: queue family ${device.queue.family_index}')
```

`Queue` is borrowed from its parent `Device` and becomes invalid when that device is destroyed. `OwnedBuffer` exposes its raw buffer and memory handles, requested size, allocation size, and selected memory-type index. Its `destroy()` method always destroys the buffer before freeing its memory; callers must destroy every buffer before destroying the parent device. `PhysicalDevice.find_memory_type()` applies both the resource's allowed-memory-type bit mask and the complete required property mask.

Custom allocation callbacks, concurrent-sharing buffers, queue priorities other than 1.0, enabled features, and device extensions deliberately remain in the raw layer for now. A future configurable owning wrapper must retain the allocator used at creation so the same callbacks are supplied during destruction.

## Next slices

1. Instance extension and layer enumeration with owned V strings.
2. Presentation-support selection layered onto the core queue-flag helper.
3. Configurable queue requests, extension validation, and enabled features.
4. Owned images, command pools, and synchronization objects, each with explicit parent ownership and destruction ordering.
5. Builders only where they eliminate unsafe pointer/count bookkeeping; Vulkan synchronization and memory choices should remain explicit.
