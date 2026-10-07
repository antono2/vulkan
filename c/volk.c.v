// Compiles the bundled Volk implementation once for the V binding.
// Loader declarations share the pinned Vulkan headers selected here.
module c

#flag -I@VMODROOT/c/vendor/include
#flag -I@VMODROOT/c/vendor/volk
#flag linux -Wl,-Bsymbolic
#include "@VMODROOT/c/volk_impl.h"
