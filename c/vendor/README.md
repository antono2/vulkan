# Bundled Vulkan build inputs

`include/vulkan` and `include/vk_video` contain the C headers from
[KhronosGroup/Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)
at the commit in the repository's `REGISTRY_COMMIT` file. Their license is in
`VULKAN_HEADERS_LICENSE.md`; the referenced Apache 2.0 and MIT license texts
are in `LICENSES/`.

`volk/volk.h` and `volk/volk.c` come from
[zeux/volk](https://github.com/zeux/volk) at the commit in `VOLK_COMMIT`.
The Volk MIT license notice is included in `volk/volk.h`.

The CI workflow compares the bundled files byte for byte with those pinned
upstream revisions. The Vulkan loader and a Vulkan implementation are runtime
requirements and are not bundled here.
