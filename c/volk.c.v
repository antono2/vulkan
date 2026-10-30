// Compiles the bundled Volk implementation once for the V binding.
// Loader declarations share the pinned Vulkan headers selected here.
module c

#flag -I@VMODROOT/c/vendor/include
#flag -I@VMODROOT/c/vendor/volk
#flag linux -Wl,-Bsymbolic
// Establish the pinned core before GLFW or another consumer includes Vulkan.
#preinclude "@VMODROOT/c/volk_impl.h"
