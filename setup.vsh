#!/usr/bin/env -S v

/* 
  This script will download the current Vulkan Software Development Kit for your Operating System.
  It will not setup the required environment variables.
  Plase take a look at https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html
*/

import net.http as web
import json
import os

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
  other
}

// print command then execute it
fn sh(cmd string) {
	println('❯ ${cmd}')
	print(execute_or_exit(cmd).output)
}

versions_path := 'AvailableVulkanVersions.json'
web.download_file('https://vulkan.lunarg.com/sdk/latest.json', versions_path) or { panic('Could not download the latest Vulkan SDK version. ${err}') }
versions_json := os.read_file(versions_path) or { panic('Could not read file ${versions_path}. ${err}') }
println('Got current versions:\n${versions_json}')
versions := json.decode(VulkanVersions, versions_json) or { panic('Could not decode json for latest Vulkan SDK version. ${err}') }

mut version := 'none'
mut cur_os := CurOS.other
//mut file_name := 'none'
mut file_type := 'none'

$if linux {
  version = versions.linux
  cur_os = CurOS.linux
  file_type = 'tar.xz'
}
$if macos {
  version = versions.mac
  cur_os = CurOS.macos
  file_type = 'zip'
}
$if windows {
  version = versions.windows
  cur_os = CurOS.windows
  file_type = 'exe'
}
// Any other os/platform. Assuming windows arm
if version == 'none' {
  version = versions.warm
  file_type = 'exe'
}

file_name := '${version}_vulkan_sdk.${file_type}'
download_dir := os.vmodules_dir()
file_path := '${download_dir}/${file_name}'
download_url := 'https://sdk.lunarg.com/sdk/download/${version}/linux/vulkan_sdk.${file_type}'

println('Downloading to ${file_path}\nfrom\n${download_url}')
web.download_file(download_url, file_path) or { panic('Could not download Vulkan SDK from ${download_url}. ${err}') }
println('Saved Vulkan Software Development Kit to ${file_path}')


// NOTE: We could update .bashrc and other shell configs automatically to make env vars permanent
match cur_os {
  .linux {
    println('Unpacking to ${download_dir}')
    sh('tar xf ${file_path} -C ${download_dir}')
    println('Got all the files, but that\'s not enough.')
    println('Please take a look at ${download_dir}/${version}/README.txt')
    println('Manually append this to your \'~/.bashrc\' to make required environment variables permanent:')
    println('\nsource ${download_dir}/${version}/setup-env.sh\n')
  }
  .windows {
    println('Go double click ${file_path}. It will run the setup and configure your environment variables.')
  }
  .macos {
    println('SDK available to unpack at ${file_path}')
  }
  else {
    panic('Not sure which OS to install Vulkan SDK for.')
  }
}

// Check which environment variables are already set
env_vk_sdk := $env('VULKAN_SDK')
if env_vk_sdk != '' {
  println('VULKAN_SDK is GOOD.')
  env_path := $env('PATH')
  if env_path.contains('${env_vk_sdk}/bin') || env_path.to_lower().contains('${env_vk_sdk}\bin') {
    println('PATH is GOOD.')
  } else {
    println('PATH is NOT SET for vulkan.\nShould be something like ${env_vk_sdk}/bin')
  }
} else { println('VULKAN_SDK is NOT SET.') }

if $env('LD_LIBRARY_PATH') != '' { println('LD_LIBRARY_PATH is GOOD.') } else { println('LD_LIBRARY_PATH is NOT SET.') }
if $env('VK_LAYER_PATH') != '' { println('VK_LAYER_PATH is GOOD.') } else { println('VK_LAYER_PATH is NOT SET.') }
if $env('VK_ADD_LAYER_PATH') != '' { println('VK_ADD_LAYER_PATH is GOOD.') } else { println('VK_ADD_LAYER_PATH is NOT SET.') }
if $env('PKG_CONFIG_PATH') != '' { println('PKG_CONFIG_PATH is GOOD.') } else { println('PKG_CONFIG_PATH is NOT SET.') }


