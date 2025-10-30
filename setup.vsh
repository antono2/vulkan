#!/usr/bin/env -S v

/* 
  This script will download the current Vulkan Software Development Kit for your Operating System.
  It will not setup the required environment variables.
  Plase take a look at https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html
*/

import net.http as web
import json

struct VulkanVersions {
mut:
  linux string
  mac string
  windows string
  warm string
}

enum CurOS {
  linux
  macos
  windows
  warm
  other
}

// print command then execute it
fn sh(cmd string) {
  println("❯ ${cmd}")
  print(execute_or_exit(cmd).output)
}

versions_path := "AvailableVulkanVersions.json"
web.download_file("https://vulkan.lunarg.com/sdk/latest.json", versions_path) or { panic("Could not download the latest Vulkan SDK version. ${err}") }
versions_json := read_file(versions_path) or { panic("Could not read file ${versions_path}. ${err}") }
println("Got current versions:")
println(versions_json)
versions := json.decode(VulkanVersions, versions_json) or { panic("Could not decode json for latest Vulkan SDK version. ${err}") }

mut version := "none"
mut cur_os := CurOS.other
mut download_url := "none"
$if linux {
  version = versions.linux
  cur_os = CurOS.linux
  download_url  = "https://sdk.lunarg.com/sdk/download/${version}/linux/vulkan_sdk.tar.xz"
}
$if macos {
  version = versions.mac
  cur_os = CurOS.macos
  download_url = "https://sdk.lunarg.com/sdk/download/${version}/mac/vulkansdk-macos-${version}.zip"
}
$if windows {
  version = versions.windows
  cur_os = CurOS.windows
  download_url = "https://sdk.lunarg.com/sdk/download/${version}/windows/vulkansdk-windows-X64-${version}.exe"
}
// Any other os/platform. Assuming windows arm
if version == "none" {
  version = versions.warm
  cur_os = CurOS.warm
  download_url = "https://sdk.lunarg.com/sdk/download/${version}/warm/vulkansdk-windows-ARM64-${version}.exe"
}

// splits the string into an array of strings at the given delimiter, starting from the right. If delim is empty the string is split by it"s characters.
file_name := download_url.rsplit("/")[0]
download_dir := vmodules_dir()
file_path := join_path_single(download_dir, file_name)

println("Downloading to ${file_path}")
println("from")
println("${download_url}")
web.download_file(download_url, file_path) or { panic("Could not download Vulkan SDK from ${download_url}. ${err}") }
println("Saved Vulkan Software Development Kit to")
println(file_path)

match cur_os {
  .linux {
    println("Unpacking to ${download_dir}")
    sh("tar xf ${file_path} -C ${download_dir}")
    println("Got all the files, but thats not enough.")
    println("Please take a look at ${download_dir}/${version}/README.txt")
    println("Manually append this to your ~/.bashrc to make required environment variables permanent:")
    println("source ${download_dir}/${version}/setup-env.sh")
  }
  .windows {
    println("Go double click ${file_path}. It will run the setup and configure your environment variables.")
  }
  .macos {
    println("SDK available to unpack at ${file_path}")
  }
  .warm {
    println("SDK available at ${file_path}")
  }
  else {
    println("SDK available at ${file_path}")
  }
}

println("")
println("Checking which environment variables are already set:")
env_vk_sdk := $env("VULKAN_SDK")
if env_vk_sdk != "" {
  println("VULKAN_SDK is GOOD.")
  env_path := $env("PATH")
  if env_path.contains("${env_vk_sdk}") {
    println("PATH is GOOD.")
  } else {
    println("PATH is NOT SET for vulkan.")
    println("Should be something like ${env_vk_sdk}/bin")
  }
} else { println("VULKAN_SDK is NOT SET.") }

if $env("LD_LIBRARY_PATH") != "" &&
   $env("LD_LIBRARY_PATH").contains($env("VULKAN_SDK")) { println("LD_LIBRARY_PATH is GOOD.") } else { println("LD_LIBRARY_PATH is NOT SET.") }
if $env("VK_LAYER_PATH") != "" { println("VK_LAYER_PATH is GOOD.") } else { println("VK_LAYER_PATH is NOT SET.") }
if $env("VK_ADD_LAYER_PATH") != "" { println("VK_ADD_LAYER_PATH is GOOD.") } else { println("VK_ADD_LAYER_PATH is NOT SET.") }
if $env("PKG_CONFIG_PATH") != "" { println("PKG_CONFIG_PATH is GOOD.") } else { println("PKG_CONFIG_PATH is NOT SET.") }


