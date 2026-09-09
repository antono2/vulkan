# Changelog

This changelog tracks the semantic version of the V module in `v.mod`.
Generated binding snapshots continue to use the Vulkan registry version stored
in `VERSION`.

## 1.6.0 - 2026-09-09

### Added

- Multiple logical-device queue requests across distinct queue families, with
  per-queue priorities, all borrowed queues exposed through `Device.queues`,
  and queue-specific command-pool creation.

### Fixed

- Legacy nonzero queue indices now request every Vulkan queue through the
  selected index before retrieving that queue.

### Changed

- Install the pinned Vulkan SDK and SwiftShader CI artifacts without the
  deprecated Node 20 release-downloader action.

## 1.5.0 - 2026-09-08

### Added

- A validation-enabled end-to-end lifecycle smoke test covering instance,
  device, buffer, image, image view, command pool, command buffer, fence,
  semaphore, queue submission, and ordered cleanup.
- Owned instance layer/extension and physical-device extension discovery.
- Validated instance options and configurable single-queue device creation with
  queue index, priority, extensions, core features, and a feature `pNext` chain.
- Presentation-support queries and graphics/presentation queue-family selection.
- Linux, macOS, and Windows CI coverage, with both released and master V tested
  on Linux.
- Immutable Vulkan-Headers and Volk source revisions used by CI.

### Changed

- Package releases now use the semantic version in `v.mod`; `VERSION` remains
  the generated Vulkan registry version.
- Image-view creation rejects image usage masks which violate
  `VUID-VkImageViewCreateInfo-image-04441` before calling Vulkan.
- Releases are created only from an explicitly pushed matching package tag.

## 1.1.0 - 2026-09-07

### Added

- An opt-in `antono2.vulkan.ergonomic` API with typed `VulkanError` values,
  loader-aware instance ownership, physical-device discovery, and owned device
  names while preserving non-negative Vulkan result statuses.
- Queue-family discovery and complete required-flag selection, single-queue
  logical-device creation, loaded device commands, explicit device destruction,
  and raw device and queue handles.
- Memory-type selection and owned memory-backed buffers with explicit,
  correctly ordered destruction.
- Owned command pools and primary command buffers with allocation, recording,
  reset, free, and explicit lifetime helpers.
- Owned fences and binary semaphores, including fence status, wait, and reset
  helpers that preserve `VK_NOT_READY` and `VK_TIMEOUT`.
- Owned 2D images and image views plus explicit synchronization-1 image-layout
  transition recording.
- Checked `Queue.submit()` with command-buffer batches, wait and signal
  semaphores, pipeline-stage masks, and optional fence signaling.

The complete generated Vulkan API remains available unchanged through the raw
`antono2.vulkan` module.
