module c

#flag linux -I$env('VULKAN_SDK')/include
#flag linux -I$env('VULKAN_SDK')/include/volk
#flag linux -Wl,-Bsymbolic
#flag darwin -I$env('VULKAN_SDK')/include
#flag darwin -I$env('VULKAN_SDK')/include/volk
#flag windows -I$env('VULKAN_SDK')/Include
#flag windows -I$env('VULKAN_SDK')/Include/volk
#include "@VMODROOT/c/volk_impl.h"
