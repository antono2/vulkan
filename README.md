

# Vulkan Bindings for [V](https://vlang.io/)
[Project portfolio](https://oreskin.de/projects_en.php)

[![Validate Vulkan bindings](https://github.com/antono2/vulkan/actions/workflows/generated-bindings-ci.yml/badge.svg)](https://github.com/antono2/vulkan/actions/workflows/generated-bindings-ci.yml)

[Available as `antono2.vulkan` on VPM](https://vpm.vlang.io/packages/antono2.vulkan).

`vulkan.v` and `vulkan_video.v` are generated from Khronos' canonical
[Vulkan API registry](https://github.com/KhronosGroup/Vulkan-Docs/blob/main/xml/vk.xml).
The package follows the semantic version in `v.mod`; `VERSION` records the
Vulkan registry snapshot, while `REGISTRY_COMMIT` and `VOLK_COMMIT` make the
CI header and loader inputs reproducible.

## One-command setup

Install the native Vulkan development prerequisites and this V module:

```sh
v run ~/.vmodules/antono2/vulkan/setup.vsh
```

From a source checkout, use `v run setup.vsh`. The script supports Ubuntu and
Debian, Fedora, Arch, openSUSE, macOS, and Windows with winget.
It installs headers, the Vulkan loader, Volk, diagnostic tools, and the VPM
module, then verifies the result. For a read-only support check, run:

```sh
v run setup.vsh --check
```

The SDK and loader cannot supply a hardware Vulkan implementation. If
`vulkaninfo` cannot enumerate a device after setup, install or update the GPU
vendor's driver. CI uses registry-matched headers and the pinned Volk revision
recorded by this repository rather than this convenience installer.

## Supported toolchains

| Platform | V compiler | C compiler | Validation level |
| --- | --- | --- | --- |
| Ubuntu 24.04 | V 0.5.2 | GCC and TinyCC | Compile, unit tests, and validation-layer lifecycle run |
| macOS 14 | V 0.5.2 | Clang | Compile and unit tests |
| Windows Server 2022 | V 0.5.2 | MSVC | Compile and unit tests |
| Ubuntu 24.04 | Current V master | GCC | Advisory compatibility lane |
| Ubuntu 24.04 | Pinned strict V3 | GCC | Required frontend; advisory C backend |

V 0.5.2 is the supported baseline. The generated registry snapshot determines
which declarations are available; the installed Vulkan loader and driver must
still support every command, extension, and feature an application requests.
Current V master selects V3 by default and can fall back to its V 0.5.2
compatibility compiler. CI therefore requires the pinned strict
`-new-compiler` frontend to parse and type-check the public module. Its full C
backend remains advisory while it emits unused platform-only Vulkan callback
types on unsupported hosts. The unpinned moving-master lane is also advisory
so an unrelated upstream compiler regression cannot block Vulkan maintenance.

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

[`examples/ergonomic_lifecycle`](examples/ergonomic_lifecycle) exercises the
opt-in convenience API from instance creation through queue submission and
ordered cleanup. It is a headless validation smoke test and does not open a
window:

```sh
v run examples/ergonomic_lifecycle
```

For windowed rendering, see the tested GLFW/Vulkan example in
[`antono2/v_imgui_examples`](https://github.com/antono2/v_imgui_examples) and
the Vulkan/OpenCL particle renderer in
[`antono2/opencl`](https://github.com/antono2/opencl/tree/master/examples/vulkan_particles).
The canonical binding-generator tests remain in
[`antono2/v_vulkan_bindings`](https://github.com/antono2/v_vulkan_bindings/tree/master/test).

## Ergonomic API (opt in)

The generated module remains the complete low-level binding. The opt-in
`antono2.vulkan.ergonomic` submodule adds typed errors, instance lifecycle
helpers, physical-device and queue-family discovery, and validated single- or
multi-queue logical-device ownership. It also provides explicit memory-type
selection and owned buffer/device-memory allocation, owned command pools and
primary command-buffer lifecycle helpers, synchronization objects, checked queue
submission, owned 2D images and views, and explicit image-layout transition
recording without modifying generated files. Presentation helpers collect and
select surface formats, present modes, extents, image counts, and composite
alpha modes. Host-visible buffers support checked persistent mappings and
coherent uploads, while owned shader modules accept validated SPIR-V words or
bytes.
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
	queue_requests: [vke.DeviceQueueRequest{
		queue_family: family
		priorities: [f32(1.0)]
	}]
	extensions: ['VK_KHR_swapchain']
})!
```

Each priority requests the queue at the same zero-based index in its family.
Use one `DeviceQueueRequest` per distinct family; `device.queues` exposes the
created queues in request order and `device.queue` remains the first one.

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
- [Delyan Angelov (@spytheman)](https://github.com/spytheman) — for fixing my bugs in the early days.
- [Jalon Solov (@JalonSolov)](https://github.com/JalonSolov) — for quick and solid answers to obscure questions.
- [Alexander Medvednikov (@medvednikov)](https://github.com/medvednikov) — for creating V and relentless productivity.
- The awesome team at [V](https://vlang.io/) — for making this possible.
