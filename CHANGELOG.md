# Changelog

This changelog tracks the semantic version of the V module in `v.mod`.
Generated binding snapshots continue to use the Vulkan registry version stored
in `VERSION`.

## Unreleased

## 3.2.0 - 2026-09-25

### Added

- Support mip ranges in ergonomic image creation and transitions.

### Fixed

- Generate pointer parameters for Vulkan callback array typedefs so current V3
  can compile the bindings.
- Pass Vulkan handle array storage to physical-device enumeration and command
  buffer allocation.

## 3.0.0 - 2026-09-22

### Fixed

- Spell `LogicOp.or_` with a trailing underscore because `or` is a V3 keyword.
  Its Vulkan value remains 7.
- Represent opaque Metal and IOSurface handle fields as `voidptr`, matching
  their pointer-sized C ABI while satisfying the strict V3 frontend.

## 2.0.0 - 2026-09-22

### Changed

- Mark ergonomic Vulkan owners `@[nocopy]`, borrow them by reference in helper
  and submission APIs, and make mutable destruction consistently idempotent by
  clearing native handles.
- Return owned pointers from constructors and use unambiguous `OwnedInstance`,
  `OwnedDevice`, `OwnedCommandPool`, `OwnedFence`, and `OwnedSemaphore` names so
  strict V3 does not confuse wrappers with generated raw Vulkan handle types.
- Return primary command buffers as references so allocation batches preserve
  unique wrapper ownership without copying.

## 1.8.0 - 2026-09-22

### Added

- A pinned, source-built strict V3 advisory lane alongside the released-V and
  moving-master compatibility checks.

### Changed

- Refresh the generated bindings to Vulkan registry snapshot `v1.4.363` and
  record the exact Vulkan-Headers revision used to produce them.
- Reuse an installed Vulkan SDK from the cross-platform one-command
  `setup.vsh` flow and keep its diagnostics outside project directories.
- Derive the expected Vulkan header patch from `VERSION` instead of maintaining
  a second hard-coded value in CI.
- Clarify which examples are headless versus windowed and ignore local native
  compiler products created while running examples.

### Fixed

- Preserve and compile the Vulkan loader bridge with generated updates and
  current V toolchains.
- Keep Volk implementation inclusion idempotent when strict V3 concatenates the
  module's C helper more than once.

## 1.7.0 - 2026-09-09

### Added

- Owned SPIR-V shader modules with byte-count, alignment, and magic validation.
- Checked host-visible buffer mappings, persistent coherent byte writes, and
  one-shot map/copy/unmap uploads.
- Owned surface-support discovery plus reusable format, present-mode, extent,
  image-count, and composite-alpha selection helpers.
- Typed device and queue idle waits.
- TinyCC loader and lifecycle coverage on Linux.

### Fixed

- Use a deep-bound Vulkan loader handle under TinyCC so Volk's exported global
  dispatch variables cannot shadow loader entry points.

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
