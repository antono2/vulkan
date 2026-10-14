# Rendering conveniences

Import `antono2.vulkan.ergonomic`. Native handles remain exposed, owners use
explicit `destroy()`, and child resources must be destroyed before their device.
The complete [headless example](../examples/conveniences/main.v) validates formats,
descriptors and pipeline-cache round trips.

## Formats

| Method | Inputs | Result |
| --- | --- | --- |
| `format_properties(format)` | Physical-device format | Linear/optimal/buffer feature masks |
| `select_format(preferred, tiling, required)` | Ordered formats and complete required mask | First matching format, or error |
| `image_format_properties(format, type, tiling, usage, flags)` | Exact image configuration | `supported` and native limits; other failures remain typed errors |

A feature-mask match alone does not validate an image's dimensions or sample
count. Query the exact configuration and check the returned limits as needed.
Format order is application policy, including depth precision and HDR choices.

## Descriptors

| Owner or method | Contract |
| --- | --- |
| `new_descriptor_layout(bindings)` | Unique binding numbers, nonzero counts/stages; immutable samplers use the raw API |
| `new_descriptor_pool(max_sets, sizes)` | Positive capacity; pool owns all allocated sets |
| `pool.allocate(layouts)` | Batch allocation; layouts must belong to this device |
| `set.write_buffers(binding, first, infos)` | Checks binding type and array bounds; offsets/ranges are bytes |
| `set.write_images(binding, first, infos)` | Checks binding type, array bounds and required handles |
| `pool.reset()` | Invalidates all borrowed sets and releases their allocations |

Sets are borrowed values with pool-generation checks. They do not need individual
cleanup. The pool owner must outlive the borrowed values. Reset/destruction is
rejected on subsequent helper writes, but raw handle use bypasses these checks.
Descriptor resources and their layouts remain caller responsibilities. Complete
GPU use before updating descriptors, resetting pools or destroying resources;
helpers do not infer synchronization or validate native resource lifetimes.

## Presentation

See [presentation](../examples/presentation/main.v) for a complete windowed
clear/present loop and resize recreation. It requires GLFW and a surface that
supports transfer-destination and color-attachment usage.

| Acquire result | `image_index` | Application action |
| --- | --- | --- |
| `success` | Present | Render and present |
| `suboptimal_khr` | Present | Finish the acquired image's synchronization cycle; schedule recreation |
| `timeout`, `not_ready` | Absent | Pump events/retry according to application policy |
| `error_out_of_date_khr` | Absent | Recreate when the framebuffer extent is nonzero |
| Other failures | Error | Handle the native Vulkan error |

`new_swapchain(info)` requires the device's `VK_KHR_swapchain` extension. It owns
its image views and exposes borrowed swapchain images. It supports one array
layer. Enumeration retries `VK_INCOMPLETE`; partial construction cleans up views
and the swapchain. `Queue.present()` preserves success, suboptimal and out-of-date
results. It does not reset fences, run an event loop or recreate automatically.

Keep a render-finished semaphore per swapchain image, and wait for frame work
before reusing command buffers. Reset a frame fence only immediately before the
submission that will signal it. Destroy dependent framebuffers before the
swapchain. If `oldSwapchain` is provided, Vulkan retirement rules still apply,
including creation failure. Do not assume the old swapchain remains acquirable.

## Diagnostics and caches

| API | Requirements and lifetime |
| --- | --- |
| `device.debug_labels()` | Enable instance `VK_EXT_debug_utils`; returns loaded begin/end label commands |
| `new_timestamp_queries(count)` | Selected queue family must support timestamps; explicit reset/write/read |
| `queries.read()` | Nonblocking; inspect each sample's `available` field |
| `queries.elapsed_ns(start, end)` | Available samples from one clock domain; accounts for one counter wrap |
| `new_pipeline_cache(bytes)` | Empty bytes start a cache; supplied blobs must match device/vendor/UUID |
| `cache.bytes()` | Owned byte copy; caller externally synchronizes cache access |

Use the public cache handle when creating pipelines. Cache import errors are
explicit; applications can choose an empty-cache fallback. These APIs do not
choose filenames or perform disk writes. Reuse/cache benefits depend on workload
and driver and should be measured separately from correctness checks.

## Interoperability queries

Create an instance with `api_version: vk.api_version_1_1` or newer to use
`instance.device_identity(physical)`, `external_buffer_properties(...)` and
`external_semaphore_properties(...)`. Query the exact buffer usage/flags and
external handle type. The returned native properties include compatible handle
types, import/export support and dedicated-allocation requirements.

Use the device UUID with OpenCL's `DeviceRequirements.required_uuid` to select
the same physical device. Matching UUIDs alone never establishes zero-copy
support: validate both APIs' memory and semaphore capabilities and ownership
rules. These Vulkan queries have no OpenCL dependency.
