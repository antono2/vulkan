# Ownership model

The ergonomic module uses explicit destruction and exposes raw Vulkan handles.
Every successfully created owning wrapper must be destroyed before its parent,
in the reverse order of creation.

`OwnedInstance`, `OwnedDevice`, `OwnedCommandPool`, `PrimaryCommandBuffer`,
`OwnedBuffer`, `OwnedImage`, `OwnedImageView`, `OwnedFence`, `OwnedSemaphore`,
`MappedBufferMemory`, and `OwnedShaderModule` are marked `@[nocopy]`. Their
constructors return owned pointers so resources cross module boundaries without
copying. Keep the pointers in `mut` variables when they need cleanup and pass
them directly to helpers; do not add another `&`.

Destruction, command-buffer freeing, and unmapping are explicit, mutable, and
idempotent: they clear the corresponding handle or pointer. This prevents a
second cleanup through the same value, but does not replace Vulkan's parent /
child lifetime rules. There are no implicit finalizers.

`PhysicalDevice`, `QueueFamily`, `Queue`, discovery snapshots, and raw Vulkan
handles remain copyable borrowed values. A copied `Queue` does not extend its
parent `OwnedDevice` lifetime.

A mapped range borrows its `OwnedBuffer`; unmap it before destroying the buffer.
An `OwnedShaderModule` must be destroyed before its parent device. A successful
`new_shader_module*` call copies or consumes SPIR-V only during creation, so the
input slice need not outlive the call.

Follow these rules:

1. Store every owner in a mutable variable and register cleanup immediately.
2. Pass owner pointers directly; copy only borrowed snapshots or raw handles.
3. Destroy children before parents.
4. Do not use an owner after cleanup, or a borrowed value after its owner is
   destroyed.

Pass optional Vulkan host allocation callbacks through `InstanceOptions.allocator`,
`DeviceOptions.allocator`, or `new_instance_with_allocator()`. Each root owner
copies the callback structure; device child owners inherit that copy and use it
for creation, failure cleanup, and destruction. Keep the callback functions and
anything referenced by `pUserData` valid until all affected children and their
parent owner have been destroyed. Instance and device allocators are chosen
independently. These callbacks control Vulkan host allocations; they do not
replace `VkDeviceMemory` selection or suballocation.
