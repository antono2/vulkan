module ergonomic

import antono2.vulkan as vk

fn test_multisample_image_request_keeps_sample_flags_single_and_rejects_invalid_native_inputs() ! {
	usage := u32(vk.ImageUsageFlagBits.color_attachment)
	for samples in [vk.SampleCountFlagBits._1, ._2, ._4, ._8, ._16, ._32, ._64] {
		validate_multisample_image_request(1, 1, .r16g16b16a16_sfloat, samples, usage)!
	}
	invalid_combined_flags := unsafe { vk.SampleCountFlagBits(3) }
	if _ := validate_multisample_image_request(1, 1, .r16g16b16a16_sfloat,
		invalid_combined_flags, usage) {
		assert false
	}
	for dimensions in [[u32(0), 1]!, [u32(1), 0]!] {
		if _ := validate_multisample_image_request(dimensions[0], dimensions[1],
			.r16g16b16a16_sfloat, ._4, usage) {
			assert false
		}
	}
	if _ := validate_multisample_image_request(1, 1, .undefined, ._4, usage) {
		assert false
	}
	if _ := validate_multisample_image_request(1, 1, .r16g16b16a16_sfloat, ._4, 0) {
		assert false
	}
	device := unsafe { &OwnedDevice(nil) }
	if _ := device.new_multisample_image_2d(1, 1, .r16g16b16a16_sfloat, ._4, usage,
		u32(vk.MemoryPropertyFlagBits.device_local)) {
		assert false
	}
}
