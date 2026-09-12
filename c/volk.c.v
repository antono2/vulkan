module c

#flag linux -I$env('VULKAN_SDK')/include
#flag linux -I$env('VULKAN_SDK')/include/volk
#flag linux -Wl,-Bsymbolic
#flag darwin -I$env('VULKAN_SDK')/include
#flag darwin -I$env('VULKAN_SDK')/include/volk
#flag windows -I$env('VULKAN_SDK')/Include
#flag windows -I$env('VULKAN_SDK')/Include/volk
#define VK_NO_PROTOTYPES
#define VOLK_IMPLEMENTATION
#if __has_include(<volk.h>)
#include <volk.h>
#elif __has_include(<volk/volk.h>)
#include <volk/volk.h>
#else
#error "Volk headers not found; run `v run setup.vsh` from antono2.vulkan"
#endif
#include "loader_bridge.h"
