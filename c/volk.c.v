module c

#flag -I@VMODROOT/c/vendor/include
#flag -I@VMODROOT/c/vendor/volk
#flag linux -Wl,-Bsymbolic
#include "@VMODROOT/c/volk_impl.h"
