// Fails compilation if a dependent C header is included before the pinned Vulkan core.
#ifndef VK_HEADER_VERSION
#error "Pinned Vulkan headers must precede consumer includes"
#endif
static uint32_t v_vulkan_consumer_header_version(void) {
    return VK_HEADER_VERSION;
}
