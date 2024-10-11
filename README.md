

# Vulkan Bindings for [Vlang](https://vlang.io/)
The bindings in `src/vulkan.v` were generated from the current [KhronosGroup](https://github.com/KhronosGroup/) [API description](https://github.com/KhronosGroup/Vulkan-Docs/blob/main/xml/vk.xml).

## Dependencies
Please make sure to clone the commit tag matching your installed [Vulkan SDK](https://vulkan.lunarg.com/doc/sdk/latest/).

### Linux
Please install the [Vulkan SDK](https://vulkan.lunarg.com/sdk/home).
Further reading at [https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html](https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html).

GLFW is required for the example app. It provides OS independent window creation.
You can get it at [glfw.org download](https://www.glfw.org/download.html).
Or just use the package manager.
```

$ apt search glfw

libglfw3-dev/jammy,now 3.3.6-1 amd64

portable library for OpenGL, window and input (development files)

$ sudo apt install libglfw3-dev

```
`VULKAN_SDK` is an environment variable and should have the path to your [Vulkan SDK](https://vulkan.lunarg.com/doc/sdk/latest/), like `$HOME/vulkansdk-linux-x86_64-1.3.290.0/x86_64`. Besides that `LD_LIBRARY_PATH` and `VK_LAYER_PATH` have to be set. On linux you can append this to your shell start script
```
export VULKAN_SDK=$HOME/vulkansdk-linux-x86_64-<VERSION>/x86_64
export LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
```

### Windows
Please install the [Vulkan SDK](https://vulkan.lunarg.com/sdk/home).
All environment variables are set automatically by the installer.

GLFW is required for the example app. It provides OS independent window creation.
You can get it at [glfw.org download](https://www.glfw.org/download.html).

Set GLFW paths in `examples\vk_glfw_volk.v`.
```
#flag windows -I<PATH TO GLFW INCLUDE, LIKE C:\glfw-3.4.bin.WIN64\include>
#flag windows -L<PATH TO GLFW LIB, LIKE C:\glfw-3.4.bin.WIN64\lib-mingw-w64>
```
GLFW releases different binaries for different compilers, which are in different directories.
You will also have to pass the `-cc <compiler>` parameter to V when compiling the app.

## Run Examples
There is an app `vk_glfw_volk.v`, which opens a window and listens for keyboard events.
Please make sure to pick the tag matching your SDK installation, like `--branch v1.3.290`.
### Linux
```

git clone --depth 1 --branch <YOUR_VERSION> https://github.com/antono2/vulkan.git

cd vulkan

v run examples/vk_glfw_volk.v

```
### Windows
As of this writing, V expects a directory structure like `modules/vulkan/vulkan.v` for the example app to find the bindings. On Linux we can cheat with a symbolic link, on Windows we can duplicate `vulkan.v` and move the example app. Please make sure to pick the tag matching your SDK installation, like `--branch v1.3.290`.
This is one way to run, using the [MinGW tool chain](https://github.com/niXman/mingw-builds-binaries). In case of another C compiler, please change the GLFW library search directory and v `-cc` parameter accordingly.

```

git clone --depth 1 --branch <YOUR_VERSION> https://github.com/antono2/vulkan.git

cd vulkan

mkdir modules\vulkan

copy examples\vk_glfw_volk.v .

copy src\vulkan.v modules\vulkan

v -cc x86_64-w64-mingw32-gcc run vk_glfw_volk.v

```


## Further Reading
### Doesn't work. What now?
For missing information, like `Could not create vulkan instance. VkResult: error_layer_not_present`, please double check for missing environment variables and correct paths.

For vulkan related issues you can try [`VK_LOADER_DEBUG=all`](https://github.com/KhronosGroup/Vulkan-Loader/blob/main/docs/LoaderInterfaceArchitecture.md#active-environment-variables).

### Compiler #Flags
There are some `#include` in the vulkan bindings, for which the correct compiler flags have to be set by you.
The example already contains all required flags for Windows and Linux x64.

### Why [Volk](https://github.com/zeux/volk)?
Any vulkan function has some name (symbol) and address in your local library. These addresses have to be found either at compile time or dynamically.
In V we can use `C.` function type definitions and a simple `#flag -lvulkan`, which does this at compile time.
Unfortunately this requires conditional compilation for extension code blocks in the V vulkan bindings and additional work by the user to load required extension functions, when they need them.

Alternatively we can load the function address whenever we first call it. Well, V has a [built in dynamic loader](https://modules.vlang.io/dl.loader.html), but there is a ready to use solution. We can just use [Volk](https://github.com/zeux/volk), which is provided by the [Vulkan SDK](https://vulkan.lunarg.com/doc/sdk/latest/) and does the same thing.

### [GLFW](https://www.glfw.org/download.html) Bindings?
There are some C. functions for GLFW at the bottom of the example. V bindings for GLFW are available, but I prefer to control the global namespace for C. functions, as they might overlap and cause issues later. This will change in future.

## Pull Request
There is always stuff to do and help is welcome. The goal is to cover some more vulkan functionality by example. Roughly like [this](https://github.com/SaschaWillems/Vulkan).

Please rebase your local branch with origin/master and squash the commit log before creating the pull request.
It helps with readability and generally improves life quality.
Note that `vulkan.v` is generated in a different repository (not open source yet) and can not be edited directly.
In that case, please feel free to open an issue or start a discussion.

## LICENSE

`Public Domain` for anything in this repository.


# Thanks
Big thanks to [@spytheman](https://github.com/spytheman) for fixing my bugs in times of need.</br>
To [@JalonSolov](https://github.com/JalonSolov) for quick and solid answers to obscure questions.

