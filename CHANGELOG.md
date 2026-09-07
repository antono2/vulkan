# Changelog

This changelog tracks the semantic version of the V module in `v.mod`.
Generated binding snapshots continue to use the Vulkan registry version stored
in `VERSION`.

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
