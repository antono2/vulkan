# Local validation — 2026-10-14

Validated on Linux with V 0.5.2, GCC and TinyCC, and an NVIDIA GeForce GTX 1060
6GB. These results describe this checkout, not a cross-platform certification.
Windows and macOS compilation checks are configured in CI but were not run locally.

- All six ergonomic unit-test files passed.
- The convenience example exercised format queries, descriptor reset
  invalidation, cache roundtrip/rejection, labels, timestamps and external-resource
  capability queries. It passed with Vulkan validation enabled.
- The GLFW presentation example rendered, resized, recreated its swapchain and
  rendered again under Xvfb with Vulkan validation enabled.
- Strict V3 frontend checks passed for convenience and presentation examples.
- Setup probes and mocked package-command tests passed, including preservation
  of an existing installed module version.
- README code matches the executable first-use example.

The handwritten ergonomic layer owns these changes; generated Vulkan bindings
and the Vulkan registry generator do not need regeneration for these helpers.
Applications still choose synchronization, resource lifetimes and backend policy.
