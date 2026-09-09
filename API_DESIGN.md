# Ergonomic Vulkan API

The generated `vulkan.v` and `vulkan_video.v` files remain the complete, low-level API. Hand-written conveniences live in the opt-in `antono2.vulkan.ergonomic` submodule so registry regeneration cannot overwrite them and existing programs do not change behavior.

## Conventions

- Raw Vulkan handles remain available through a public `handle` field. Wrappers do not hide escape hatches needed for extensions or interoperability.
- A negative `VkResult` becomes a typed `VulkanError` containing both the original result and the operation name. `check` preserves non-negative statuses; `require_success` enforces exact success where that is the operation's contract.
- Constructors return V results (`!T`) and perform required loader/dispatch setup.
- Vulkan objects use explicit `destroy()` methods. There are no implicit finalizers, and each successfully created owned object must be destroyed exactly once.
- V value structs are copyable. Copying an owning wrapper does not transfer ownership; exactly one copy may perform destruction. A future breaking release should move ownership state behind a shared control block so copied wrappers cannot double-destroy a native handle.
- Two-call enumerations return V arrays and internally retry `VK_INCOMPLETE`.
- Generated names and signatures are never edited to improve ergonomics. New wrappers compose them from the submodule.

## Discovery through resources and queue submission

The first slice covers loader initialization, default-allocator instance creation and destruction, physical-device enumeration, core property snapshots, and owned device-name strings. Later slices add queue-family and logical-device selection, owned memory-backed buffers and images, image views and explicit layout-transition recording, command pools and primary command buffers, fences and binary semaphores, and checked queue submission:

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
image_usage := u32(vk.ImageUsageFlagBits.sampled) | u32(vk.ImageUsageFlagBits.transfer_dst)
image := device.new_image_2d(640, 480, .r8g8b8a8_unorm, .optimal, image_usage,
	memory_properties)!
defer {
	image.destroy()
}
view := image.new_view(u32(vk.ImageAspectFlagBits.color))!
defer {
	view.destroy()
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
transition := vke.ImageLayoutTransition{
	old_layout: .undefined
	new_layout: .transfer_dst_optimal
	src_stage_mask: u32(vk.PipelineStageFlagBits.top_of_pipe)
	dst_stage_mask: u32(vk.PipelineStageFlagBits.transfer)
	src_access_mask: 0
	dst_access_mask: u32(vk.AccessFlagBits.transfer_write)
	dependency_flags: 0
	aspect_mask: u32(vk.ImageAspectFlagBits.color)
}
command_buffer.transition_image_layout(image, transition)!
command_buffer.end()!
mut fence := device.new_fence(false)!
defer {
	fence.destroy()
}
mut image_ready := device.new_semaphore()!
defer {
	image_ready.destroy()
}
mut render_finished := device.new_semaphore()!
defer {
	render_finished.destroy()
}
submit_options := vke.SubmitOptions{
	wait_semaphores: [image_ready]
	wait_stage_masks: [u32(vk.PipelineStageFlagBits.color_attachment_output)]
	signal_semaphores: [render_finished]
	fence: fence
}
device.queue.submit([command_buffer], submit_options)!
println('${physical_device.name()}: queue family ${device.queue.family_index}')
```

`Queue` is borrowed from its parent `Device` and becomes invalid when that device is destroyed. `Device.queues` contains every requested queue in request and queue-index order, while `Device.queue` remains the selected legacy queue or the first multi-queue request for compatibility. Queue requests are grouped by distinct family, and each priority maps to the same zero-based queue index in that family. The convenience API creates ordinary queues with zero `VkDeviceQueueCreateFlags`; protected or otherwise flagged queue configurations remain available through the raw API. `OwnedBuffer` exposes its raw buffer and memory handles, requested size, allocation size, and selected memory-type index. Its `destroy()` method always destroys the buffer before freeing its memory; callers must destroy every buffer before destroying the parent device. `PhysicalDevice.find_memory_type()` applies both the resource's allowed-memory-type bit mask and the complete required property mask.

`CommandPool` belongs to its parent `Device` and is fixed to one requested queue-family index. `new_command_pool()` uses `Device.queue`; `new_command_pool_for_queue()` accepts any queue borrowed from that device and rejects foreign queues. `PrimaryCommandBuffer` retains the exact device and pool handles needed by `free()`, while its public raw `handle` remains available for recording and submission. `free()` is idempotent and clears that raw handle. Reset, begin, and end failures are returned as typed `VulkanError` values. Destroying a command pool implicitly frees and invalidates all command buffers still allocated from it; callers may either free buffers explicitly before pool destruction or rely on that Vulkan lifetime rule, but must never use or free a buffer after its pool is destroyed. Every command pool must be destroyed before its parent device.

`Fence` exposes status, timeout-aware waiting, and reset while preserving positive Vulkan statuses such as `VK_NOT_READY` and `VK_TIMEOUT`. `Fence` and `Semaphore` expose their raw handles for submission structures, clear those handles during idempotent destruction, and must be destroyed before their parent device.

`Queue.submit()` accepts a non-empty primary-command-buffer batch plus optional wait semaphores, signal semaphores, and a fence. Every wait semaphore requires a pipeline-stage mask at the same array index; mismatched counts are rejected before Vulkan is called. The helper keeps all temporary raw-handle arrays alive through `vkQueueSubmit`, passes a null fence when none is supplied, returns non-negative Vulkan statuses unchanged, and converts failures to `VulkanError`.

`OwnedImage` creates a simple exclusive-sharing 2D image with one mip level, one array layer, and one sample. It exposes the raw image and memory handles plus its format, extent, tiling, usage, allocation size, and selected memory type. Destruction releases the image before its bound allocation, and must happen before destroying the parent device. More specialized image creation remains available through the raw layer.

`OwnedImageView` creates an identity-swizzled 2D view using the image's format and explicit aspect mask. It exposes the raw view and parent-image handles, view type, format, and complete subresource range. Every view must be destroyed before its image.

`ImageLayoutTransition` keeps the synchronization-1 source/destination stage masks, access masks, old/new layouts, dependency flags, and aspect mask explicit. `PrimaryCommandBuffer.transition_image_layout()` records one image-only `vkCmdPipelineBarrier` over the owned image's single mip level and array layer. It does not infer synchronization, track layout state, or perform queue-family ownership transfers; use the raw API for broader ranges, ownership transfers, or synchronization-2 barriers.

`InstanceOptions` validates and owns instance layer/extension name pointers through creation. `DeviceOptions` accepts either its compatible single-queue fields or `DeviceQueueRequest` values for multiple queues and families, plus device extensions, core features, and an application-owned feature `pNext` chain. `PhysicalDevice.find_present_queue_family()` layers surface support over the existing queue-flag selection. Custom allocation callbacks and concurrent-sharing resources remain in the raw layer. A future allocator-aware owning wrapper must retain the allocator used at creation so the same callbacks are supplied during destruction.

## Next slices

1. Instance extension and layer enumeration with owned V strings. (Implemented.)
2. Presentation-support selection layered onto the core queue-flag helper. (Implemented.)
3. Configurable queue requests, extension validation, and enabled features. (Implemented, including multiple queues and families.)
4. Owned fences and binary semaphores with explicit parent ownership and destruction ordering. (Implemented.)
5. Owned 2D images with explicit parent ownership and destruction ordering. (Implemented.)
6. Checked primary command-buffer queue submission with explicit synchronization. (Implemented.)
7. Owned 2D image views and focused synchronization-1 layout-transition recording. (Implemented.)
8. Builders only where they eliminate unsafe pointer/count bookkeeping; Vulkan synchronization and memory choices should remain explicit.
