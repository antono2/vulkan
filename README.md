

# Vulkan Bindings for [V](https://vlang.io/)
`vulkan.v` and `vulkan_video.v` are generated from Khronos' canonical
[Vulkan API registry](https://github.com/KhronosGroup/Vulkan-Docs/blob/main/xml/vk.xml).
The package follows the semantic version in `v.mod`; `VERSION` records the
Vulkan registry snapshot, while `REGISTRY_COMMIT` and `VOLK_COMMIT` make the
CI header and loader inputs reproducible.

## Dependencies
Please install the [Vulkan SDK](https://vulkan.lunarg.com/sdk/home) and set the [environment variables](https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html)

## Install
Download the latest bindings to your local `.vmodules` directory:

```
v install antono2.vulkan
```

Applications using the binding directly must initialize Volk before the first
Vulkan call, then load instance- and device-level commands after creating the
corresponding handles:

```v
import antono2.vulkan as vk

if vk.initialize_loader() != .success {
	panic('Vulkan loader initialization failed')
}
// create the Vulkan instance
vk.load_instance_commands(instance)
// create the Vulkan device
vk.load_device_commands(device)
```

### Historical Vulkan versions

The original tags from `v1.3.290` through `v1.4.335` are preserved exactly as
published. They use a source layout accepted by the V compiler available at the
time, but not by current V releases. For a historical Vulkan version with a
current V compiler, install its matching `+vcompat.1` tag instead:

```
v install https://github.com/antono2/vulkan@v1.4.335+vcompat.1
```

Compatibility tags contain bindings regenerated from the same tagged
Khronos Vulkan registry. They do not move or replace the original tags.
`v1.4.362` and later tags already use the current layout and need no
compatibility suffix.

## Examples
An example can be found at  [antono2/v_vulkan_bindings/test](https://github.com/antono2/v_vulkan_bindings/tree/master/test)</br>
Using GLFW and Dear ImGui [antono2/v_imgui_examples](https://github.com/antono2/v_imgui_examples)

## Ergonomic API (opt in)

The generated module remains the complete low-level binding. The opt-in
`antono2.vulkan.ergonomic` submodule adds typed errors, instance lifecycle
helpers, physical-device and queue-family discovery, and single-queue logical
device ownership. It also provides explicit memory-type selection and owned
buffer/device-memory allocation, owned command pools and primary command-buffer
lifecycle helpers, synchronization objects, checked queue submission, owned 2D
images and views, and explicit image-layout transition recording without modifying
generated files.
See [the ergonomic API design](API_DESIGN.md).

Instance and device configuration can validate requested names before Vulkan is
called:

```v
instance := vke.new_instance_with_options(vke.InstanceOptions{
	application_name: 'my app'
	extensions: ['VK_KHR_surface']
})!

family := physical_device.find_queue_family(u32(vk.QueueFlagBits.graphics)) or {
	return error('no graphics queue')
}
device := physical_device.new_device_with_options(vke.DeviceOptions{
	queue_family: family
	extensions: ['VK_KHR_swapchain']
})!
```

The CI lifecycle smoke test runs the ergonomic path from instance creation
through queue submission and cleanup under `VK_LAYER_KHRONOS_validation`.
Run it locally with:

```sh
VK_INSTANCE_LAYERS=VK_LAYER_KHRONOS_validation \
  v run examples/ergonomic_lifecycle
```

## Generate
The generator is located at [antono2/v_vulkan_bindings](https://github.com/antono2/v_vulkan_bindings)

# Thanks
Big thanks to [@spytheman](https://github.com/spytheman) for fixing my bugs in times of need.</br>
To [@JalonSolov](https://github.com/JalonSolov) for quick and solid answers to obscure questions.</br>
The awesome team at [V](https://vlang.io/) for making this possible.
