# Clear, present, resize

![Vulkan blue clear at 640 × 360 and then 800 × 450](preview.gif)

The preview holds a frame from each swapchain generation so the resize is easy to see. The example itself presents six frames at each size and exits.

Install GLFW's native development files and the dependency in this example's
`v.mod`. Use the Vulkan checkout containing the new ergonomic helpers as your
`antono2.vulkan` module. From the Vulkan repository root:

```sh
v run examples/presentation
```

The example clears a window, presents six frames, resizes it, then creates a new
swapchain and presents six more frames. It exits after reporting both generations.
Run under validation with `VK_INSTANCE_LAYERS=VK_LAYER_KHRONOS_validation`.
On headless Linux, use `xvfb-run -a` around the compiled executable.

The example requires transfer-destination and color-attachment swapchain usage,
and a graphics queue that supports presentation. Applications can use other
rendering paths through the same swapchain owner. Runtime failures remain visible.
