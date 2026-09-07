# Ergonomic Vulkan API

The generated `vulkan.v` and `vulkan_video.v` files remain the complete, low-level API. Hand-written conveniences live in the opt-in `antono2.vulkan.ergonomic` submodule so registry regeneration cannot overwrite them and existing programs do not change behavior.

## Conventions

- Raw Vulkan handles remain available through a public `handle` field. Wrappers do not hide escape hatches needed for extensions or interoperability.
- A negative `VkResult` becomes a typed `VulkanError` containing both the original result and the operation name. `check` preserves non-negative statuses; `require_success` enforces exact success where that is the operation's contract.
- Constructors return V results (`!T`) and perform required loader/dispatch setup.
- Vulkan objects use explicit `destroy()` methods. There are no implicit finalizers, and each successfully created owned object must be destroyed exactly once.
- Two-call enumerations return V arrays and internally retry `VK_INCOMPLETE`.
- Generated names and signatures are never edited to improve ergonomics. New wrappers compose them from the submodule.

## First slice

The first slice covers loader initialization, default-allocator instance creation and destruction, physical-device enumeration, core property snapshots, and owned device-name strings:

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
for device in instance.physical_devices()! {
	println('${device.name()} (${device.properties.vendorID:04x}:${device.properties.deviceID:04x})')
}
```

Custom allocation callbacks deliberately remain in the raw layer for now. A future owning wrapper must retain the allocator used at creation so the same callbacks are supplied during destruction.

## Next slices

1. Instance extension and layer enumeration with owned V strings.
2. Queue-family discovery and selection helpers that express required flags and presentation support.
3. Logical-device creation with queue requests, extension validation, and instance/device dispatch loading.
4. Owned buffers, images, command pools, and synchronization objects, each with explicit parent ownership and destruction ordering.
5. Builders only where they eliminate unsafe pointer/count bookkeeping; Vulkan synchronization and memory choices should remain explicit.
