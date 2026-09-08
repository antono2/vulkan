# Ownership model

The ergonomic module uses explicit destruction and exposes raw Vulkan handles.
Every successfully created owning wrapper must be destroyed before its parent,
in the reverse order of creation.

V structs are values and can be copied. A copied `Instance`, `Device`,
`CommandPool`, `OwnedBuffer`, `OwnedImage`, or `OwnedImageView` refers to the
same native allocation; destroying more than one copy is invalid. `Fence`,
`Semaphore`, and `PrimaryCommandBuffer` clear their handle when a mutable value
is destroyed or freed, but a previously made copy is still independent and can
retain the old handle.

Until a breaking ownership redesign, follow these rules:

1. Treat owning wrappers as move-only by convention.
2. Pass borrowed references or raw handles to helpers instead of copying owners.
3. Register cleanup immediately and destroy children before parents.
4. Never destroy or free from more than one copy.

The intended `v2` design is a reference-backed ownership control block. All
copies would observe one closed state, native destruction would happen at most
once, and borrowed views such as `Queue` would remain explicitly non-owning.
Custom allocation callbacks must be retained in that control block so destroy
calls use the allocator supplied at creation.
