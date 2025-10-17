/*
MIT License

Copyright Anton Oreskin | https://gosudev.de


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
module vulkan

pub fn make_video_std_version(major u32, minor u32, patch u32) u32 {
	return (major << 22) | (minor << 12) | patch
}

pub const std_video_h264_cpb_cnt_list_size = u32(32)
pub const std_video_h264_scaling_list_4x4_num_lists = u32(6)
pub const std_video_h264_scaling_list_4x4_num_elements = u32(16)
pub const std_video_h264_scaling_list_8x8_num_lists = u32(6)
pub const std_video_h264_scaling_list_8x8_num_elements = u32(64)
pub const std_video_h264_max_num_list_ref = u32(32)
pub const std_video_h264_max_chroma_planes = u32(2)
pub const std_video_h264_no_reference_picture = u8(0xff)

pub enum StdVideoH264ChromaFormatIdc as u32 {
	monochrome = 0
	_420       = 1
	_422       = 2
	_444       = 3
	invalid    = u32(0x7FFFFFFF)
}

pub enum StdVideoH264ProfileIdc as u32 {
	baseline           = 66
	main               = 77
	high               = 100
	high444_predictive = 244
	invalid            = u32(0x7FFFFFFF)
}

pub enum StdVideoH264LevelIdc as u32 {
	_1_0    = 0
	_1_1    = 1
	_1_2    = 2
	_1_3    = 3
	_2_0    = 4
	_2_1    = 5
	_2_2    = 6
	_3_0    = 7
	_3_1    = 8
	_3_2    = 9
	_4_0    = 10
	_4_1    = 11
	_4_2    = 12
	_5_0    = 13
	_5_1    = 14
	_5_2    = 15
	_6_0    = 16
	_6_1    = 17
	_6_2    = 18
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH264PocType as u32 {
	_0      = 0
	_1      = 1
	_2      = 2
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH264AspectRatioIdc as u32 {
	unspecified  = 0
	square       = 1
	_12_11       = 2
	_10_11       = 3
	_16_11       = 4
	_40_33       = 5
	_24_11       = 6
	_20_11       = 7
	_32_11       = 8
	_80_33       = 9
	_18_11       = 10
	_15_11       = 11
	_64_33       = 12
	_160_99      = 13
	_4_3         = 14
	_3_2         = 15
	_2_1         = 16
	extended_sar = 255
	invalid      = u32(0x7FFFFFFF)
}

pub enum StdVideoH264WeightedBipredIdc as u32 {
	default  = 0
	explicit = 1
	implicit = 2
	invalid  = u32(0x7FFFFFFF)
}

pub enum StdVideoH264ModificationOfPicNumsIdc as u32 {
	short_term_subtract = 0
	short_term_add      = 1
	long_term           = 2
	end                 = 3
	invalid             = u32(0x7FFFFFFF)
}

pub enum StdVideoH264MemMgmtControlOp as u32 {
	end                       = 0
	unmark_short_term         = 1
	unmark_long_term          = 2
	mark_long_term            = 3
	set_max_long_term_index   = 4
	unmark_all                = 5
	mark_current_as_long_term = 6
	invalid                   = u32(0x7FFFFFFF)
}

pub enum StdVideoH264CabacInitIdc as u32 {
	_0      = 0
	_1      = 1
	_2      = 2
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH264DisableDeblockingFilterIdc as u32 {
	disabled = 0
	enabled  = 1
	partial  = 2
	invalid  = u32(0x7FFFFFFF)
}

pub enum StdVideoH264SliceType as u32 {
	p       = 0
	b       = 1
	i       = 2
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH264PictureType as u32 {
	p       = 0
	b       = 1
	i       = 2
	idr     = 5
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH264NonVclNaluType as u32 {
	sps             = 0
	pps             = 1
	aud             = 2
	prefix          = 3
	end_of_sequence = 4
	end_of_stream   = 5
	precoded        = 6
	invalid         = u32(0x7FFFFFFF)
}
pub type StdVideoH264SpsVuiFlags = C.StdVideoH264SpsVuiFlags

@[typedef]
pub struct C.StdVideoH264SpsVuiFlags {
pub mut:
	aspect_ratio_info_present_flag  u32
	overscan_info_present_flag      u32
	overscan_appropriate_flag       u32
	video_signal_type_present_flag  u32
	video_full_range_flag           u32
	color_description_present_flag  u32
	chroma_loc_info_present_flag    u32
	timing_info_present_flag        u32
	fixed_frame_rate_flag           u32
	bitstream_restriction_flag      u32
	nal_hrd_parameters_present_flag u32
	vcl_hrd_parameters_present_flag u32
}

pub type StdVideoH264HrdParameters = C.StdVideoH264HrdParameters

@[typedef]
pub struct C.StdVideoH264HrdParameters {
pub mut:
	cpb_cnt_minus1                          u8
	bit_rate_scale                          u8
	cpb_size_scale                          u8
	reserved1                               u8
	bit_rate_value_minus1                   [std_video_h264_cpb_cnt_list_size]u32
	cpb_size_value_minus1                   [std_video_h264_cpb_cnt_list_size]u32
	cbr_flag                                [std_video_h264_cpb_cnt_list_size]u8
	initial_cpb_removal_delay_length_minus1 u32
	cpb_removal_delay_length_minus1         u32
	dpb_output_delay_length_minus1          u32
	time_offset_length                      u32
}

pub type StdVideoH264SequenceParameterSetVui = C.StdVideoH264SequenceParameterSetVui

@[typedef]
pub struct C.StdVideoH264SequenceParameterSetVui {
pub mut:
	flags                               StdVideoH264SpsVuiFlags
	aspect_ratio_idc                    StdVideoH264AspectRatioIdc
	sar_width                           u16
	sar_height                          u16
	video_format                        u8
	colour_primaries                    u8
	transfer_characteristics            u8
	matrix_coefficients                 u8
	num_units_in_tick                   u32
	time_scale                          u32
	max_num_reorder_frames              u8
	max_dec_frame_buffering             u8
	chroma_sample_loc_type_top_field    u8
	chroma_sample_loc_type_bottom_field u8
	reserved1                           u32
	pHrdParameters                      &StdVideoH264HrdParameters
}

pub type StdVideoH264SpsFlags = C.StdVideoH264SpsFlags

@[typedef]
pub struct C.StdVideoH264SpsFlags {
pub mut:
	constraint_set0_flag                 u32
	constraint_set1_flag                 u32
	constraint_set2_flag                 u32
	constraint_set3_flag                 u32
	constraint_set4_flag                 u32
	constraint_set5_flag                 u32
	direct_8x8_inference_flag            u32
	mb_adaptive_frame_field_flag         u32
	frame_mbs_only_flag                  u32
	delta_pic_order_always_zero_flag     u32
	separate_colour_plane_flag           u32
	gaps_in_frame_num_value_allowed_flag u32
	qpprime_y_zero_transform_bypass_flag u32
	frame_cropping_flag                  u32
	seq_scaling_matrix_present_flag      u32
	vui_parameters_present_flag          u32
}

pub type StdVideoH264ScalingLists = C.StdVideoH264ScalingLists

@[typedef]
pub struct C.StdVideoH264ScalingLists {
pub mut:
	scaling_list_present_mask       u16
	use_default_scaling_matrix_mask u16
	ScalingList4x4                  [std_video_h264_scaling_list_4x4_num_lists][std_video_h264_scaling_list_4x4_num_elements]u8
	ScalingList8x8                  [std_video_h264_scaling_list_8x8_num_lists][std_video_h264_scaling_list_8x8_num_elements]u8
}

pub type StdVideoH264SequenceParameterSet = C.StdVideoH264SequenceParameterSet

@[typedef]
pub struct C.StdVideoH264SequenceParameterSet {
pub mut:
	flags                                 StdVideoH264SpsFlags
	profile_idc                           StdVideoH264ProfileIdc
	level_idc                             StdVideoH264LevelIdc
	chroma_format_idc                     StdVideoH264ChromaFormatIdc
	seq_parameter_set_id                  u8
	bit_depth_luma_minus8                 u8
	bit_depth_chroma_minus8               u8
	log2_max_frame_num_minus4             u8
	pic_order_cnt_type                    StdVideoH264PocType
	offset_for_non_ref_pic                i32
	offset_for_top_to_bottom_field        i32
	log2_max_pic_order_cnt_lsb_minus4     u8
	num_ref_frames_in_pic_order_cnt_cycle u8
	max_num_ref_frames                    u8
	reserved1                             u8
	pic_width_in_mbs_minus1               u32
	pic_height_in_map_units_minus1        u32
	frame_crop_left_offset                u32
	frame_crop_right_offset               u32
	frame_crop_top_offset                 u32
	frame_crop_bottom_offset              u32
	reserved2                             u32
	pOffsetForRefFrame                    &i32
	pScalingLists                         &StdVideoH264ScalingLists
	pSequenceParameterSetVui              &StdVideoH264SequenceParameterSetVui
}

pub type StdVideoH264PpsFlags = C.StdVideoH264PpsFlags

@[typedef]
pub struct C.StdVideoH264PpsFlags {
pub mut:
	transform_8x8_mode_flag                      u32
	redundant_pic_cnt_present_flag               u32
	constrained_intra_pred_flag                  u32
	deblocking_filter_control_present_flag       u32
	weighted_pred_flag                           u32
	bottom_field_pic_order_in_frame_present_flag u32
	entropy_coding_mode_flag                     u32
	pic_scaling_matrix_present_flag              u32
}

pub type StdVideoH264PictureParameterSet = C.StdVideoH264PictureParameterSet

@[typedef]
pub struct C.StdVideoH264PictureParameterSet {
pub mut:
	flags                                StdVideoH264PpsFlags
	seq_parameter_set_id                 u8
	pic_parameter_set_id                 u8
	num_ref_idx_l0_default_active_minus1 u8
	num_ref_idx_l1_default_active_minus1 u8
	weighted_bipred_idc                  StdVideoH264WeightedBipredIdc
	pic_init_qp_minus26                  i8
	pic_init_qs_minus26                  i8
	chroma_qp_index_offset               i8
	second_chroma_qp_index_offset        i8
	pScalingLists                        &StdVideoH264ScalingLists
}

pub const std_vulkan_video_codec_h264_decode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_video_decode_h264_field_order_count_list_size = u32(2)
pub const std_vulkan_video_codec_h264_decode_spec_version = std_vulkan_video_codec_h264_decode_api_version_1_0_0
pub const std_vulkan_video_codec_h264_decode_extension_name = c'VK_STD_vulkan_video_codec_h264_decode'

pub enum StdVideoDecodeH264FieldOrderCount as u32 {
	top     = 0
	bottom  = 1
	invalid = u32(0x7FFFFFFF)
}
pub type StdVideoDecodeH264PictureInfoFlags = C.StdVideoDecodeH264PictureInfoFlags

@[typedef]
pub struct C.StdVideoDecodeH264PictureInfoFlags {
pub mut:
	field_pic_flag           u32
	is_intra                 u32
	IdrPicFlag               u32
	bottom_field_flag        u32
	is_reference             u32
	complementary_field_pair u32
}

pub type StdVideoDecodeH264PictureInfo = C.StdVideoDecodeH264PictureInfo

@[typedef]
pub struct C.StdVideoDecodeH264PictureInfo {
pub mut:
	flags                StdVideoDecodeH264PictureInfoFlags
	seq_parameter_set_id u8
	pic_parameter_set_id u8
	reserved1            u8
	reserved2            u8
	frame_num            u16
	idr_pic_id           u16
	PicOrderCnt          [std_video_decode_h264_field_order_count_list_size]i32
}

pub type StdVideoDecodeH264ReferenceInfoFlags = C.StdVideoDecodeH264ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoDecodeH264ReferenceInfoFlags {
pub mut:
	top_field_flag               u32
	bottom_field_flag            u32
	used_for_long_term_reference u32
	is_non_existing              u32
}

pub type StdVideoDecodeH264ReferenceInfo = C.StdVideoDecodeH264ReferenceInfo

@[typedef]
pub struct C.StdVideoDecodeH264ReferenceInfo {
pub mut:
	flags       StdVideoDecodeH264ReferenceInfoFlags
	FrameNum    u16
	reserved    u16
	PicOrderCnt [std_video_decode_h264_field_order_count_list_size]i32
}

pub const std_vulkan_video_codec_h264_encode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_vulkan_video_codec_h264_encode_spec_version = std_vulkan_video_codec_h264_encode_api_version_1_0_0
pub const std_vulkan_video_codec_h264_encode_extension_name = c'VK_STD_vulkan_video_codec_h264_encode'

pub type StdVideoEncodeH264WeightTableFlags = C.StdVideoEncodeH264WeightTableFlags

@[typedef]
pub struct C.StdVideoEncodeH264WeightTableFlags {
pub mut:
	luma_weight_l0_flag   u32
	chroma_weight_l0_flag u32
	luma_weight_l1_flag   u32
	chroma_weight_l1_flag u32
}

pub type StdVideoEncodeH264WeightTable = C.StdVideoEncodeH264WeightTable

@[typedef]
pub struct C.StdVideoEncodeH264WeightTable {
pub mut:
	flags                    StdVideoEncodeH264WeightTableFlags
	luma_log2_weight_denom   u8
	chroma_log2_weight_denom u8
	luma_weight_l0           [std_video_h264_max_num_list_ref]i8
	luma_offset_l0           [std_video_h264_max_num_list_ref]i8
	chroma_weight_l0         [std_video_h264_max_num_list_ref][std_video_h264_max_chroma_planes]i8
	chroma_offset_l0         [std_video_h264_max_num_list_ref][std_video_h264_max_chroma_planes]i8
	luma_weight_l1           [std_video_h264_max_num_list_ref]i8
	luma_offset_l1           [std_video_h264_max_num_list_ref]i8
	chroma_weight_l1         [std_video_h264_max_num_list_ref][std_video_h264_max_chroma_planes]i8
	chroma_offset_l1         [std_video_h264_max_num_list_ref][std_video_h264_max_chroma_planes]i8
}

pub type StdVideoEncodeH264SliceHeaderFlags = C.StdVideoEncodeH264SliceHeaderFlags

@[typedef]
pub struct C.StdVideoEncodeH264SliceHeaderFlags {
pub mut:
	direct_spatial_mv_pred_flag      u32
	num_ref_idx_active_override_flag u32
	reserved                         u32
}

pub type StdVideoEncodeH264PictureInfoFlags = C.StdVideoEncodeH264PictureInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH264PictureInfoFlags {
pub mut:
	IdrPicFlag                         u32
	is_reference                       u32
	no_output_of_prior_pics_flag       u32
	long_term_reference_flag           u32
	adaptive_ref_pic_marking_mode_flag u32
	reserved                           u32
}

pub type StdVideoEncodeH264ReferenceInfoFlags = C.StdVideoEncodeH264ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH264ReferenceInfoFlags {
pub mut:
	used_for_long_term_reference u32
	reserved                     u32
}

pub type StdVideoEncodeH264ReferenceListsInfoFlags = C.StdVideoEncodeH264ReferenceListsInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH264ReferenceListsInfoFlags {
pub mut:
	ref_pic_list_modification_flag_l0 u32
	ref_pic_list_modification_flag_l1 u32
	reserved                          u32
}

pub type StdVideoEncodeH264RefListModEntry = C.StdVideoEncodeH264RefListModEntry

@[typedef]
pub struct C.StdVideoEncodeH264RefListModEntry {
pub mut:
	modification_of_pic_nums_idc StdVideoH264ModificationOfPicNumsIdc
	abs_diff_pic_num_minus1      u16
	long_term_pic_num            u16
}

pub type StdVideoEncodeH264RefPicMarkingEntry = C.StdVideoEncodeH264RefPicMarkingEntry

@[typedef]
pub struct C.StdVideoEncodeH264RefPicMarkingEntry {
pub mut:
	memory_management_control_operation StdVideoH264MemMgmtControlOp
	difference_of_pic_nums_minus1       u16
	long_term_pic_num                   u16
	long_term_frame_idx                 u16
	max_long_term_frame_idx_plus1       u16
}

pub type StdVideoEncodeH264ReferenceListsInfo = C.StdVideoEncodeH264ReferenceListsInfo

@[typedef]
pub struct C.StdVideoEncodeH264ReferenceListsInfo {
pub mut:
	flags                        StdVideoEncodeH264ReferenceListsInfoFlags
	num_ref_idx_l0_active_minus1 u8
	num_ref_idx_l1_active_minus1 u8
	RefPicList0                  [std_video_h264_max_num_list_ref]u8
	RefPicList1                  [std_video_h264_max_num_list_ref]u8
	refList0ModOpCount           u8
	refList1ModOpCount           u8
	refPicMarkingOpCount         u8
	reserved1                    [7]u8
	pRefList0ModOperations       &StdVideoEncodeH264RefListModEntry
	pRefList1ModOperations       &StdVideoEncodeH264RefListModEntry
	pRefPicMarkingOperations     &StdVideoEncodeH264RefPicMarkingEntry
}

pub type StdVideoEncodeH264PictureInfo = C.StdVideoEncodeH264PictureInfo

@[typedef]
pub struct C.StdVideoEncodeH264PictureInfo {
pub mut:
	flags                StdVideoEncodeH264PictureInfoFlags
	seq_parameter_set_id u8
	pic_parameter_set_id u8
	idr_pic_id           u16
	primary_pic_type     StdVideoH264PictureType
	frame_num            u32
	PicOrderCnt          i32
	temporal_id          u8
	reserved1            [3]u8
	pRefLists            &StdVideoEncodeH264ReferenceListsInfo
}

pub type StdVideoEncodeH264ReferenceInfo = C.StdVideoEncodeH264ReferenceInfo

@[typedef]
pub struct C.StdVideoEncodeH264ReferenceInfo {
pub mut:
	flags               StdVideoEncodeH264ReferenceInfoFlags
	primary_pic_type    StdVideoH264PictureType
	FrameNum            u32
	PicOrderCnt         i32
	long_term_pic_num   u16
	long_term_frame_idx u16
	temporal_id         u8
}

pub type StdVideoEncodeH264SliceHeader = C.StdVideoEncodeH264SliceHeader

@[typedef]
pub struct C.StdVideoEncodeH264SliceHeader {
pub mut:
	flags                         StdVideoEncodeH264SliceHeaderFlags
	first_mb_in_slice             u32
	slice_type                    StdVideoH264SliceType
	slice_alpha_c0_offset_div2    i8
	slice_beta_offset_div2        i8
	slice_qp_delta                i8
	reserved1                     u8
	cabac_init_idc                StdVideoH264CabacInitIdc
	disable_deblocking_filter_idc StdVideoH264DisableDeblockingFilterIdc
	pWeightTable                  &StdVideoEncodeH264WeightTable
}

pub const std_video_h265_sublayers_list_size = u32(7)
pub const std_video_h265_cpb_cnt_list_size = u32(32)
pub const std_video_h265_scaling_list_4x4_num_lists = u32(6)
pub const std_video_h265_scaling_list_4x4_num_elements = u32(16)
pub const std_video_h265_scaling_list_8x8_num_lists = u32(6)
pub const std_video_h265_scaling_list_8x8_num_elements = u32(64)
pub const std_video_h265_scaling_list_16x16_num_lists = u32(6)
pub const std_video_h265_scaling_list_16x16_num_elements = u32(64)
pub const std_video_h265_scaling_list_32x32_num_lists = u32(2)
pub const std_video_h265_scaling_list_32x32_num_elements = u32(64)
pub const std_video_h265_predictor_palette_components_list_size = u32(3)
pub const std_video_h265_predictor_palette_comp_entries_list_size = u32(128)
pub const std_video_h265_max_dpb_size = u32(16)
pub const std_video_h265_max_long_term_ref_pics_sps = u32(32)
pub const std_video_h265_chroma_qp_offset_list_size = u32(6)
pub const std_video_h265_chroma_qp_offset_tile_cols_list_size = u32(19)
pub const std_video_h265_chroma_qp_offset_tile_rows_list_size = u32(21)
pub const std_video_h265_max_num_list_ref = u32(15)
pub const std_video_h265_max_chroma_planes = u32(2)
pub const std_video_h265_max_short_term_ref_pic_sets = u32(64)
pub const std_video_h265_max_long_term_pics = u32(16)
pub const std_video_h265_max_delta_poc = u32(48)
pub const std_video_h265_no_reference_picture = u8(0xff)

pub enum StdVideoH265ChromaFormatIdc as u32 {
	monochrome = 0
	_420       = 1
	_422       = 2
	_444       = 3
	invalid    = u32(0x7FFFFFFF)
}

pub enum StdVideoH265ProfileIdc as u32 {
	main                    = 1
	main10                  = 2
	main_still_picture      = 3
	format_range_extensions = 4
	scc_extensions          = 9
	invalid                 = u32(0x7FFFFFFF)
}

pub enum StdVideoH265LevelIdc as u32 {
	_1_0    = 0
	_2_0    = 1
	_2_1    = 2
	_3_0    = 3
	_3_1    = 4
	_4_0    = 5
	_4_1    = 6
	_5_0    = 7
	_5_1    = 8
	_5_2    = 9
	_6_0    = 10
	_6_1    = 11
	_6_2    = 12
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH265SliceType as u32 {
	b       = 0
	p       = 1
	i       = 2
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH265PictureType as u32 {
	p       = 0
	b       = 1
	i       = 2
	idr     = 3
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoH265AspectRatioIdc as u32 {
	unspecified  = 0
	square       = 1
	_12_11       = 2
	_10_11       = 3
	_16_11       = 4
	_40_33       = 5
	_24_11       = 6
	_20_11       = 7
	_32_11       = 8
	_80_33       = 9
	_18_11       = 10
	_15_11       = 11
	_64_33       = 12
	_160_99      = 13
	_4_3         = 14
	_3_2         = 15
	_2_1         = 16
	extended_sar = 255
	invalid      = u32(0x7FFFFFFF)
}
pub type StdVideoH265DecPicBufMgr = C.StdVideoH265DecPicBufMgr

@[typedef]
pub struct C.StdVideoH265DecPicBufMgr {
pub mut:
	max_latency_increase_plus1   [std_video_h265_sublayers_list_size]u32
	max_dec_pic_buffering_minus1 [std_video_h265_sublayers_list_size]u8
	max_num_reorder_pics         [std_video_h265_sublayers_list_size]u8
}

pub type StdVideoH265SubLayerHrdParameters = C.StdVideoH265SubLayerHrdParameters

@[typedef]
pub struct C.StdVideoH265SubLayerHrdParameters {
pub mut:
	bit_rate_value_minus1    [std_video_h265_cpb_cnt_list_size]u32
	cpb_size_value_minus1    [std_video_h265_cpb_cnt_list_size]u32
	cpb_size_du_value_minus1 [std_video_h265_cpb_cnt_list_size]u32
	bit_rate_du_value_minus1 [std_video_h265_cpb_cnt_list_size]u32
	cbr_flag                 u32
}

pub type StdVideoH265HrdFlags = C.StdVideoH265HrdFlags

@[typedef]
pub struct C.StdVideoH265HrdFlags {
pub mut:
	nal_hrd_parameters_present_flag           u32
	vcl_hrd_parameters_present_flag           u32
	sub_pic_hrd_params_present_flag           u32
	sub_pic_cpb_params_in_pic_timing_sei_flag u32
	fixed_pic_rate_general_flag               u32
	fixed_pic_rate_within_cvs_flag            u32
	low_delay_hrd_flag                        u32
}

pub type StdVideoH265HrdParameters = C.StdVideoH265HrdParameters

@[typedef]
pub struct C.StdVideoH265HrdParameters {
pub mut:
	flags                                        StdVideoH265HrdFlags
	tick_divisor_minus2                          u8
	du_cpb_removal_delay_increment_length_minus1 u8
	dpb_output_delay_du_length_minus1            u8
	bit_rate_scale                               u8
	cpb_size_scale                               u8
	cpb_size_du_scale                            u8
	initial_cpb_removal_delay_length_minus1      u8
	au_cpb_removal_delay_length_minus1           u8
	dpb_output_delay_length_minus1               u8
	cpb_cnt_minus1                               [std_video_h265_sublayers_list_size]u8
	elemental_duration_in_tc_minus1              [std_video_h265_sublayers_list_size]u16
	reserved                                     [3]u16
	pSubLayerHrdParametersNal                    &StdVideoH265SubLayerHrdParameters
	pSubLayerHrdParametersVcl                    &StdVideoH265SubLayerHrdParameters
}

pub type StdVideoH265VpsFlags = C.StdVideoH265VpsFlags

@[typedef]
pub struct C.StdVideoH265VpsFlags {
pub mut:
	vps_temporal_id_nesting_flag             u32
	vps_sub_layer_ordering_info_present_flag u32
	vps_timing_info_present_flag             u32
	vps_poc_proportional_to_timing_flag      u32
}

pub type StdVideoH265ProfileTierLevelFlags = C.StdVideoH265ProfileTierLevelFlags

@[typedef]
pub struct C.StdVideoH265ProfileTierLevelFlags {
pub mut:
	general_tier_flag                  u32
	general_progressive_source_flag    u32
	general_interlaced_source_flag     u32
	general_non_packed_constraint_flag u32
	general_frame_only_constraint_flag u32
}

pub type StdVideoH265ProfileTierLevel = C.StdVideoH265ProfileTierLevel

@[typedef]
pub struct C.StdVideoH265ProfileTierLevel {
pub mut:
	flags               StdVideoH265ProfileTierLevelFlags
	general_profile_idc StdVideoH265ProfileIdc
	general_level_idc   StdVideoH265LevelIdc
}

pub type StdVideoH265VideoParameterSet = C.StdVideoH265VideoParameterSet

@[typedef]
pub struct C.StdVideoH265VideoParameterSet {
pub mut:
	flags                             StdVideoH265VpsFlags
	vps_video_parameter_set_id        u8
	vps_max_sub_layers_minus1         u8
	reserved1                         u8
	reserved2                         u8
	vps_num_units_in_tick             u32
	vps_time_scale                    u32
	vps_num_ticks_poc_diff_one_minus1 u32
	reserved3                         u32
	pDecPicBufMgr                     &StdVideoH265DecPicBufMgr
	pHrdParameters                    &StdVideoH265HrdParameters
	pProfileTierLevel                 &StdVideoH265ProfileTierLevel
}

pub type StdVideoH265ScalingLists = C.StdVideoH265ScalingLists

@[typedef]
pub struct C.StdVideoH265ScalingLists {
pub mut:
	ScalingList4x4         [std_video_h265_scaling_list_4x4_num_lists][std_video_h265_scaling_list_4x4_num_elements]u8
	ScalingList8x8         [std_video_h265_scaling_list_8x8_num_lists][std_video_h265_scaling_list_8x8_num_elements]u8
	ScalingList16x16       [std_video_h265_scaling_list_16x16_num_lists][std_video_h265_scaling_list_16x16_num_elements]u8
	ScalingList32x32       [std_video_h265_scaling_list_32x32_num_lists][std_video_h265_scaling_list_32x32_num_elements]u8
	ScalingListDCCoef16x16 [std_video_h265_scaling_list_16x16_num_lists]u8
	ScalingListDCCoef32x32 [std_video_h265_scaling_list_32x32_num_lists]u8
}

pub type StdVideoH265SpsVuiFlags = C.StdVideoH265SpsVuiFlags

@[typedef]
pub struct C.StdVideoH265SpsVuiFlags {
pub mut:
	aspect_ratio_info_present_flag          u32
	overscan_info_present_flag              u32
	overscan_appropriate_flag               u32
	video_signal_type_present_flag          u32
	video_full_range_flag                   u32
	colour_description_present_flag         u32
	chroma_loc_info_present_flag            u32
	neutral_chroma_indication_flag          u32
	field_seq_flag                          u32
	frame_field_info_present_flag           u32
	default_display_window_flag             u32
	vui_timing_info_present_flag            u32
	vui_poc_proportional_to_timing_flag     u32
	vui_hrd_parameters_present_flag         u32
	bitstream_restriction_flag              u32
	tiles_fixed_structure_flag              u32
	motion_vectors_over_pic_boundaries_flag u32
	restricted_ref_pic_lists_flag           u32
}

pub type StdVideoH265SequenceParameterSetVui = C.StdVideoH265SequenceParameterSetVui

@[typedef]
pub struct C.StdVideoH265SequenceParameterSetVui {
pub mut:
	flags                               StdVideoH265SpsVuiFlags
	aspect_ratio_idc                    StdVideoH265AspectRatioIdc
	sar_width                           u16
	sar_height                          u16
	video_format                        u8
	colour_primaries                    u8
	transfer_characteristics            u8
	matrix_coeffs                       u8
	chroma_sample_loc_type_top_field    u8
	chroma_sample_loc_type_bottom_field u8
	reserved1                           u8
	reserved2                           u8
	def_disp_win_left_offset            u16
	def_disp_win_right_offset           u16
	def_disp_win_top_offset             u16
	def_disp_win_bottom_offset          u16
	vui_num_units_in_tick               u32
	vui_time_scale                      u32
	vui_num_ticks_poc_diff_one_minus1   u32
	min_spatial_segmentation_idc        u16
	reserved3                           u16
	max_bytes_per_pic_denom             u8
	max_bits_per_min_cu_denom           u8
	log2_max_mv_length_horizontal       u8
	log2_max_mv_length_vertical         u8
	pHrdParameters                      &StdVideoH265HrdParameters
}

pub type StdVideoH265PredictorPaletteEntries = C.StdVideoH265PredictorPaletteEntries

@[typedef]
pub struct C.StdVideoH265PredictorPaletteEntries {
pub mut:
	PredictorPaletteEntries [std_video_h265_predictor_palette_components_list_size][std_video_h265_predictor_palette_comp_entries_list_size]u16
}

pub type StdVideoH265SpsFlags = C.StdVideoH265SpsFlags

@[typedef]
pub struct C.StdVideoH265SpsFlags {
pub mut:
	sps_temporal_id_nesting_flag                    u32
	separate_colour_plane_flag                      u32
	conformance_window_flag                         u32
	sps_sub_layer_ordering_info_present_flag        u32
	scaling_list_enabled_flag                       u32
	sps_scaling_list_data_present_flag              u32
	amp_enabled_flag                                u32
	sample_adaptive_offset_enabled_flag             u32
	pcm_enabled_flag                                u32
	pcm_loop_filter_disabled_flag                   u32
	long_term_ref_pics_present_flag                 u32
	sps_temporal_mvp_enabled_flag                   u32
	strong_intra_smoothing_enabled_flag             u32
	vui_parameters_present_flag                     u32
	sps_extension_present_flag                      u32
	sps_range_extension_flag                        u32
	transform_skip_rotation_enabled_flag            u32
	transform_skip_context_enabled_flag             u32
	implicit_rdpcm_enabled_flag                     u32
	explicit_rdpcm_enabled_flag                     u32
	extended_precision_processing_flag              u32
	intra_smoothing_disabled_flag                   u32
	high_precision_offsets_enabled_flag             u32
	persistent_rice_adaptation_enabled_flag         u32
	cabac_bypass_alignment_enabled_flag             u32
	sps_scc_extension_flag                          u32
	sps_curr_pic_ref_enabled_flag                   u32
	palette_mode_enabled_flag                       u32
	sps_palette_predictor_initializers_present_flag u32
	intra_boundary_filtering_disabled_flag          u32
}

pub type StdVideoH265ShortTermRefPicSetFlags = C.StdVideoH265ShortTermRefPicSetFlags

@[typedef]
pub struct C.StdVideoH265ShortTermRefPicSetFlags {
pub mut:
	inter_ref_pic_set_prediction_flag u32
	delta_rps_sign                    u32
}

pub type StdVideoH265ShortTermRefPicSet = C.StdVideoH265ShortTermRefPicSet

@[typedef]
pub struct C.StdVideoH265ShortTermRefPicSet {
pub mut:
	flags                    StdVideoH265ShortTermRefPicSetFlags
	delta_idx_minus1         u32
	use_delta_flag           u16
	abs_delta_rps_minus1     u16
	used_by_curr_pic_flag    u16
	used_by_curr_pic_s0_flag u16
	used_by_curr_pic_s1_flag u16
	reserved1                u16
	reserved2                u8
	reserved3                u8
	num_negative_pics        u8
	num_positive_pics        u8
	delta_poc_s0_minus1      [std_video_h265_max_dpb_size]u16
	delta_poc_s1_minus1      [std_video_h265_max_dpb_size]u16
}

pub type StdVideoH265LongTermRefPicsSps = C.StdVideoH265LongTermRefPicsSps

@[typedef]
pub struct C.StdVideoH265LongTermRefPicsSps {
pub mut:
	used_by_curr_pic_lt_sps_flag u32
	lt_ref_pic_poc_lsb_sps       [std_video_h265_max_long_term_ref_pics_sps]u32
}

pub type StdVideoH265SequenceParameterSet = C.StdVideoH265SequenceParameterSet

@[typedef]
pub struct C.StdVideoH265SequenceParameterSet {
pub mut:
	flags                                         StdVideoH265SpsFlags
	chroma_format_idc                             StdVideoH265ChromaFormatIdc
	pic_width_in_luma_samples                     u32
	pic_height_in_luma_samples                    u32
	sps_video_parameter_set_id                    u8
	sps_max_sub_layers_minus1                     u8
	sps_seq_parameter_set_id                      u8
	bit_depth_luma_minus8                         u8
	bit_depth_chroma_minus8                       u8
	log2_max_pic_order_cnt_lsb_minus4             u8
	log2_min_luma_coding_block_size_minus3        u8
	log2_diff_max_min_luma_coding_block_size      u8
	log2_min_luma_transform_block_size_minus2     u8
	log2_diff_max_min_luma_transform_block_size   u8
	max_transform_hierarchy_depth_inter           u8
	max_transform_hierarchy_depth_intra           u8
	num_short_term_ref_pic_sets                   u8
	num_long_term_ref_pics_sps                    u8
	pcm_sample_bit_depth_luma_minus1              u8
	pcm_sample_bit_depth_chroma_minus1            u8
	log2_min_pcm_luma_coding_block_size_minus3    u8
	log2_diff_max_min_pcm_luma_coding_block_size  u8
	reserved1                                     u8
	reserved2                                     u8
	palette_max_size                              u8
	delta_palette_max_predictor_size              u8
	motion_vector_resolution_control_idc          u8
	sps_num_palette_predictor_initializers_minus1 u8
	conf_win_left_offset                          u32
	conf_win_right_offset                         u32
	conf_win_top_offset                           u32
	conf_win_bottom_offset                        u32
	pProfileTierLevel                             &StdVideoH265ProfileTierLevel
	pDecPicBufMgr                                 &StdVideoH265DecPicBufMgr
	pScalingLists                                 &StdVideoH265ScalingLists
	pShortTermRefPicSet                           &StdVideoH265ShortTermRefPicSet
	pLongTermRefPicsSps                           &StdVideoH265LongTermRefPicsSps
	pSequenceParameterSetVui                      &StdVideoH265SequenceParameterSetVui
	pPredictorPaletteEntries                      &StdVideoH265PredictorPaletteEntries
}

pub type StdVideoH265PpsFlags = C.StdVideoH265PpsFlags

@[typedef]
pub struct C.StdVideoH265PpsFlags {
pub mut:
	dependent_slice_segments_enabled_flag           u32
	output_flag_present_flag                        u32
	sign_data_hiding_enabled_flag                   u32
	cabac_init_present_flag                         u32
	constrained_intra_pred_flag                     u32
	transform_skip_enabled_flag                     u32
	cu_qp_delta_enabled_flag                        u32
	pps_slice_chroma_qp_offsets_present_flag        u32
	weighted_pred_flag                              u32
	weighted_bipred_flag                            u32
	transquant_bypass_enabled_flag                  u32
	tiles_enabled_flag                              u32
	entropy_coding_sync_enabled_flag                u32
	uniform_spacing_flag                            u32
	loop_filter_across_tiles_enabled_flag           u32
	pps_loop_filter_across_slices_enabled_flag      u32
	deblocking_filter_control_present_flag          u32
	deblocking_filter_override_enabled_flag         u32
	pps_deblocking_filter_disabled_flag             u32
	pps_scaling_list_data_present_flag              u32
	lists_modification_present_flag                 u32
	slice_segment_header_extension_present_flag     u32
	pps_extension_present_flag                      u32
	cross_component_prediction_enabled_flag         u32
	chroma_qp_offset_list_enabled_flag              u32
	pps_curr_pic_ref_enabled_flag                   u32
	residual_adaptive_colour_transform_enabled_flag u32
	pps_slice_act_qp_offsets_present_flag           u32
	pps_palette_predictor_initializers_present_flag u32
	monochrome_palette_flag                         u32
	pps_range_extension_flag                        u32
}

pub type StdVideoH265PictureParameterSet = C.StdVideoH265PictureParameterSet

@[typedef]
pub struct C.StdVideoH265PictureParameterSet {
pub mut:
	flags                                     StdVideoH265PpsFlags
	pps_pic_parameter_set_id                  u8
	pps_seq_parameter_set_id                  u8
	sps_video_parameter_set_id                u8
	num_extra_slice_header_bits               u8
	num_ref_idx_l0_default_active_minus1      u8
	num_ref_idx_l1_default_active_minus1      u8
	init_qp_minus26                           i8
	diff_cu_qp_delta_depth                    u8
	pps_cb_qp_offset                          i8
	pps_cr_qp_offset                          i8
	pps_beta_offset_div2                      i8
	pps_tc_offset_div2                        i8
	log2_parallel_merge_level_minus2          u8
	log2_max_transform_skip_block_size_minus2 u8
	diff_cu_chroma_qp_offset_depth            u8
	chroma_qp_offset_list_len_minus1          u8
	cb_qp_offset_list                         [std_video_h265_chroma_qp_offset_list_size]i8
	cr_qp_offset_list                         [std_video_h265_chroma_qp_offset_list_size]i8
	log2_sao_offset_scale_luma                u8
	log2_sao_offset_scale_chroma              u8
	pps_act_y_qp_offset_plus5                 i8
	pps_act_cb_qp_offset_plus5                i8
	pps_act_cr_qp_offset_plus3                i8
	pps_num_palette_predictor_initializers    u8
	luma_bit_depth_entry_minus8               u8
	chroma_bit_depth_entry_minus8             u8
	num_tile_columns_minus1                   u8
	num_tile_rows_minus1                      u8
	reserved1                                 u8
	reserved2                                 u8
	column_width_minus1                       [std_video_h265_chroma_qp_offset_tile_cols_list_size]u16
	row_height_minus1                         [std_video_h265_chroma_qp_offset_tile_rows_list_size]u16
	reserved3                                 u32
	pScalingLists                             &StdVideoH265ScalingLists
	pPredictorPaletteEntries                  &StdVideoH265PredictorPaletteEntries
}

pub const std_vulkan_video_codec_h265_decode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_video_decode_h265_ref_pic_set_list_size = u32(8)
pub const std_vulkan_video_codec_h265_decode_spec_version = std_vulkan_video_codec_h265_decode_api_version_1_0_0
pub const std_vulkan_video_codec_h265_decode_extension_name = c'VK_STD_vulkan_video_codec_h265_decode'

pub type StdVideoDecodeH265PictureInfoFlags = C.StdVideoDecodeH265PictureInfoFlags

@[typedef]
pub struct C.StdVideoDecodeH265PictureInfoFlags {
pub mut:
	IrapPicFlag                     u32
	IdrPicFlag                      u32
	IsReference                     u32
	short_term_ref_pic_set_sps_flag u32
}

pub type StdVideoDecodeH265PictureInfo = C.StdVideoDecodeH265PictureInfo

@[typedef]
pub struct C.StdVideoDecodeH265PictureInfo {
pub mut:
	flags                        StdVideoDecodeH265PictureInfoFlags
	sps_video_parameter_set_id   u8
	pps_seq_parameter_set_id     u8
	pps_pic_parameter_set_id     u8
	NumDeltaPocsOfRefRpsIdx      u8
	PicOrderCntVal               i32
	NumBitsForSTRefPicSetInSlice u16
	reserved                     u16
	RefPicSetStCurrBefore        [std_video_decode_h265_ref_pic_set_list_size]u8
	RefPicSetStCurrAfter         [std_video_decode_h265_ref_pic_set_list_size]u8
	RefPicSetLtCurr              [std_video_decode_h265_ref_pic_set_list_size]u8
}

pub type StdVideoDecodeH265ReferenceInfoFlags = C.StdVideoDecodeH265ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoDecodeH265ReferenceInfoFlags {
pub mut:
	used_for_long_term_reference u32
	unused_for_reference         u32
}

pub type StdVideoDecodeH265ReferenceInfo = C.StdVideoDecodeH265ReferenceInfo

@[typedef]
pub struct C.StdVideoDecodeH265ReferenceInfo {
pub mut:
	flags          StdVideoDecodeH265ReferenceInfoFlags
	PicOrderCntVal i32
}

pub const std_vulkan_video_codec_h265_encode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_vulkan_video_codec_h265_encode_spec_version = std_vulkan_video_codec_h265_encode_api_version_1_0_0
pub const std_vulkan_video_codec_h265_encode_extension_name = c'VK_STD_vulkan_video_codec_h265_encode'

pub type StdVideoEncodeH265WeightTableFlags = C.StdVideoEncodeH265WeightTableFlags

@[typedef]
pub struct C.StdVideoEncodeH265WeightTableFlags {
pub mut:
	luma_weight_l0_flag   u16
	chroma_weight_l0_flag u16
	luma_weight_l1_flag   u16
	chroma_weight_l1_flag u16
}

pub type StdVideoEncodeH265WeightTable = C.StdVideoEncodeH265WeightTable

@[typedef]
pub struct C.StdVideoEncodeH265WeightTable {
pub mut:
	flags                          StdVideoEncodeH265WeightTableFlags
	luma_log2_weight_denom         u8
	delta_chroma_log2_weight_denom i8
	delta_luma_weight_l0           [std_video_h265_max_num_list_ref]i8
	luma_offset_l0                 [std_video_h265_max_num_list_ref]i8
	delta_chroma_weight_l0         [std_video_h265_max_num_list_ref][std_video_h265_max_chroma_planes]i8
	delta_chroma_offset_l0         [std_video_h265_max_num_list_ref][std_video_h265_max_chroma_planes]i8
	delta_luma_weight_l1           [std_video_h265_max_num_list_ref]i8
	luma_offset_l1                 [std_video_h265_max_num_list_ref]i8
	delta_chroma_weight_l1         [std_video_h265_max_num_list_ref][std_video_h265_max_chroma_planes]i8
	delta_chroma_offset_l1         [std_video_h265_max_num_list_ref][std_video_h265_max_chroma_planes]i8
}

pub type StdVideoEncodeH265SliceSegmentHeaderFlags = C.StdVideoEncodeH265SliceSegmentHeaderFlags

@[typedef]
pub struct C.StdVideoEncodeH265SliceSegmentHeaderFlags {
pub mut:
	first_slice_segment_in_pic_flag              u32
	dependent_slice_segment_flag                 u32
	slice_sao_luma_flag                          u32
	slice_sao_chroma_flag                        u32
	num_ref_idx_active_override_flag             u32
	mvd_l1_zero_flag                             u32
	cabac_init_flag                              u32
	cu_chroma_qp_offset_enabled_flag             u32
	deblocking_filter_override_flag              u32
	slice_deblocking_filter_disabled_flag        u32
	collocated_from_l0_flag                      u32
	slice_loop_filter_across_slices_enabled_flag u32
	reserved                                     u32
}

pub type StdVideoEncodeH265SliceSegmentHeader = C.StdVideoEncodeH265SliceSegmentHeader

@[typedef]
pub struct C.StdVideoEncodeH265SliceSegmentHeader {
pub mut:
	flags                  StdVideoEncodeH265SliceSegmentHeaderFlags
	slice_type             StdVideoH265SliceType
	slice_segment_address  u32
	collocated_ref_idx     u8
	MaxNumMergeCand        u8
	slice_cb_qp_offset     i8
	slice_cr_qp_offset     i8
	slice_beta_offset_div2 i8
	slice_tc_offset_div2   i8
	slice_act_y_qp_offset  i8
	slice_act_cb_qp_offset i8
	slice_act_cr_qp_offset i8
	slice_qp_delta         i8
	reserved1              u16
	pWeightTable           &StdVideoEncodeH265WeightTable
}

pub type StdVideoEncodeH265ReferenceListsInfoFlags = C.StdVideoEncodeH265ReferenceListsInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH265ReferenceListsInfoFlags {
pub mut:
	ref_pic_list_modification_flag_l0 u32
	ref_pic_list_modification_flag_l1 u32
	reserved                          u32
}

pub type StdVideoEncodeH265ReferenceListsInfo = C.StdVideoEncodeH265ReferenceListsInfo

@[typedef]
pub struct C.StdVideoEncodeH265ReferenceListsInfo {
pub mut:
	flags                        StdVideoEncodeH265ReferenceListsInfoFlags
	num_ref_idx_l0_active_minus1 u8
	num_ref_idx_l1_active_minus1 u8
	RefPicList0                  [std_video_h265_max_num_list_ref]u8
	RefPicList1                  [std_video_h265_max_num_list_ref]u8
	list_entry_l0                [std_video_h265_max_num_list_ref]u8
	list_entry_l1                [std_video_h265_max_num_list_ref]u8
}

pub type StdVideoEncodeH265PictureInfoFlags = C.StdVideoEncodeH265PictureInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH265PictureInfoFlags {
pub mut:
	is_reference                    u32
	IrapPicFlag                     u32
	used_for_long_term_reference    u32
	discardable_flag                u32
	cross_layer_bla_flag            u32
	pic_output_flag                 u32
	no_output_of_prior_pics_flag    u32
	short_term_ref_pic_set_sps_flag u32
	slice_temporal_mvp_enabled_flag u32
	reserved                        u32
}

pub type StdVideoEncodeH265LongTermRefPics = C.StdVideoEncodeH265LongTermRefPics

@[typedef]
pub struct C.StdVideoEncodeH265LongTermRefPics {
pub mut:
	num_long_term_sps          u8
	num_long_term_pics         u8
	lt_idx_sps                 [std_video_h265_max_long_term_ref_pics_sps]u8
	poc_lsb_lt                 [std_video_h265_max_long_term_pics]u8
	used_by_curr_pic_lt_flag   u16
	delta_poc_msb_present_flag [std_video_h265_max_delta_poc]u8
	delta_poc_msb_cycle_lt     [std_video_h265_max_delta_poc]u8
}

pub type StdVideoEncodeH265PictureInfo = C.StdVideoEncodeH265PictureInfo

@[typedef]
pub struct C.StdVideoEncodeH265PictureInfo {
pub mut:
	flags                      StdVideoEncodeH265PictureInfoFlags
	pic_type                   StdVideoH265PictureType
	sps_video_parameter_set_id u8
	pps_seq_parameter_set_id   u8
	pps_pic_parameter_set_id   u8
	short_term_ref_pic_set_idx u8
	PicOrderCntVal             i32
	TemporalId                 u8
	reserved1                  [7]u8
	pRefLists                  &StdVideoEncodeH265ReferenceListsInfo
	pShortTermRefPicSet        &StdVideoH265ShortTermRefPicSet
	pLongTermRefPics           &StdVideoEncodeH265LongTermRefPics
}

pub type StdVideoEncodeH265ReferenceInfoFlags = C.StdVideoEncodeH265ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoEncodeH265ReferenceInfoFlags {
pub mut:
	used_for_long_term_reference u32
	unused_for_reference         u32
	reserved                     u32
}

pub type StdVideoEncodeH265ReferenceInfo = C.StdVideoEncodeH265ReferenceInfo

@[typedef]
pub struct C.StdVideoEncodeH265ReferenceInfo {
pub mut:
	flags          StdVideoEncodeH265ReferenceInfoFlags
	pic_type       StdVideoH265PictureType
	PicOrderCntVal i32
	TemporalId     u8
}

pub const std_video_av1_max_loop_filter_strengths = u32(4)
pub const std_video_av1_total_refs_per_frame = u32(8)
pub const std_video_av1_loop_filter_adjustments = u32(2)
pub const std_video_av1_max_segments = u32(8)
pub const std_video_av1_seg_lvl_max = u32(8)
pub const std_video_av1_max_cdef_filter_strengths = u32(8)
pub const std_video_av1_max_num_planes = u32(3)
pub const std_video_av1_num_ref_frames = u32(8)
pub const std_video_av1_global_motion_params = u32(6)
pub const std_video_av1_max_num_y_points = u32(14)
pub const std_video_av1_max_num_cb_points = u32(10)
pub const std_video_av1_max_num_cr_points = u32(10)
pub const std_video_av1_max_num_pos_luma = u32(24)
pub const std_video_av1_max_num_pos_chroma = u32(25)
pub const std_video_av1_refs_per_frame = u32(7)
pub const std_video_av1_max_tile_cols = u32(64)
pub const std_video_av1_max_tile_rows = u32(64)
pub const std_video_av1_primary_ref_none = u8(7)
pub const std_video_av1_select_integer_mv = u8(2)
pub const std_video_av1_select_screen_content_tools = u32(2)
pub const std_video_av1_skip_mode_frames = u32(2)

pub enum StdVideoAV1Profile as u32 {
	main         = 0
	high         = 1
	professional = 2
	invalid      = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1Level as u32 {
	_2_0    = 0
	_2_1    = 1
	_2_2    = 2
	_2_3    = 3
	_3_0    = 4
	_3_1    = 5
	_3_2    = 6
	_3_3    = 7
	_4_0    = 8
	_4_1    = 9
	_4_2    = 10
	_4_3    = 11
	_5_0    = 12
	_5_1    = 13
	_5_2    = 14
	_5_3    = 15
	_6_0    = 16
	_6_1    = 17
	_6_2    = 18
	_6_3    = 19
	_7_0    = 20
	_7_1    = 21
	_7_2    = 22
	_7_3    = 23
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1FrameType as u32 {
	key        = 0
	inter      = 1
	intra_only = 2
	switch     = 3
	invalid    = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1ReferenceName as u32 {
	intra_frame   = 0
	last_frame    = 1
	last2_frame   = 2
	last3_frame   = 3
	golden_frame  = 4
	bwdref_frame  = 5
	altref2_frame = 6
	altref_frame  = 7
	invalid       = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1InterpolationFilter as u32 {
	eighttap        = 0
	eighttap_smooth = 1
	eighttap_sharp  = 2
	bilinear        = 3
	switchable      = 4
	invalid         = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1TxMode as u32 {
	only4x4 = 0
	largest = 1
	select  = 2
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1FrameRestorationType as u32 {
	none       = 0
	wiener     = 1
	sgrproj    = 2
	switchable = 3
	invalid    = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1ColorPrimaries as u32 {
	bt709        = 1
	unspecified  = 2
	bt470_m      = 4
	bt470_b_g    = 5
	bt601        = 6
	smpte240     = 7
	generic_film = 8
	bt2020       = 9
	xyz          = 10
	smpte431     = 11
	smpte432     = 12
	ebu3213      = 22
	invalid      = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1TransferCharacteristics as u32 {
	reserved0     = 0
	bt709         = 1
	unspecified   = 2
	reserved3     = 3
	bt470_m       = 4
	bt470_b_g     = 5
	bt601         = 6
	smpte240      = 7
	linear        = 8
	log100        = 9
	log100_sqrt10 = 10
	iec61966      = 11
	bt1361        = 12
	srgb          = 13
	bt2020_10_bit = 14
	bt2020_12_bit = 15
	smpte2084     = 16
	smpte428      = 17
	hlg           = 18
	invalid       = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1MatrixCoefficients as u32 {
	identity    = 0
	bt709       = 1
	unspecified = 2
	reserved3   = 3
	fcc         = 4
	bt470_b_g   = 5
	bt601       = 6
	smpte240    = 7
	smpte_ycgco = 8
	bt2020_ncl  = 9
	bt2020_cl   = 10
	smpte2085   = 11
	chromat_ncl = 12
	chromat_cl  = 13
	ictcp       = 14
	invalid     = u32(0x7FFFFFFF)
}

pub enum StdVideoAV1ChromaSamplePosition as u32 {
	unknown   = 0
	vertical  = 1
	colocated = 2
	reserved  = 3
	invalid   = u32(0x7FFFFFFF)
}
pub type StdVideoAV1ColorConfigFlags = C.StdVideoAV1ColorConfigFlags

@[typedef]
pub struct C.StdVideoAV1ColorConfigFlags {
pub mut:
	mono_chrome                    u32
	color_range                    u32
	separate_uv_delta_q            u32
	color_description_present_flag u32
	reserved                       u32
}

pub type StdVideoAV1ColorConfig = C.StdVideoAV1ColorConfig

@[typedef]
pub struct C.StdVideoAV1ColorConfig {
pub mut:
	flags                    StdVideoAV1ColorConfigFlags
	BitDepth                 u8
	subsampling_x            u8
	subsampling_y            u8
	reserved1                u8
	color_primaries          StdVideoAV1ColorPrimaries
	transfer_characteristics StdVideoAV1TransferCharacteristics
	matrix_coefficients      StdVideoAV1MatrixCoefficients
	chroma_sample_position   StdVideoAV1ChromaSamplePosition
}

pub type StdVideoAV1TimingInfoFlags = C.StdVideoAV1TimingInfoFlags

@[typedef]
pub struct C.StdVideoAV1TimingInfoFlags {
pub mut:
	equal_picture_interval u32
	reserved               u32
}

pub type StdVideoAV1TimingInfo = C.StdVideoAV1TimingInfo

@[typedef]
pub struct C.StdVideoAV1TimingInfo {
pub mut:
	flags                         StdVideoAV1TimingInfoFlags
	num_units_in_display_tick     u32
	time_scale                    u32
	num_ticks_per_picture_minus_1 u32
}

pub type StdVideoAV1LoopFilterFlags = C.StdVideoAV1LoopFilterFlags

@[typedef]
pub struct C.StdVideoAV1LoopFilterFlags {
pub mut:
	loop_filter_delta_enabled u32
	loop_filter_delta_update  u32
	reserved                  u32
}

pub type StdVideoAV1LoopFilter = C.StdVideoAV1LoopFilter

@[typedef]
pub struct C.StdVideoAV1LoopFilter {
pub mut:
	flags                   StdVideoAV1LoopFilterFlags
	loop_filter_level       [std_video_av1_max_loop_filter_strengths]u8
	loop_filter_sharpness   u8
	update_ref_delta        u8
	loop_filter_ref_deltas  [std_video_av1_total_refs_per_frame]i8
	update_mode_delta       u8
	loop_filter_mode_deltas [std_video_av1_loop_filter_adjustments]i8
}

pub type StdVideoAV1QuantizationFlags = C.StdVideoAV1QuantizationFlags

@[typedef]
pub struct C.StdVideoAV1QuantizationFlags {
pub mut:
	using_qmatrix u32
	diff_uv_delta u32
	reserved      u32
}

pub type StdVideoAV1Quantization = C.StdVideoAV1Quantization

@[typedef]
pub struct C.StdVideoAV1Quantization {
pub mut:
	flags      StdVideoAV1QuantizationFlags
	base_q_idx u8
	DeltaQYDc  i8
	DeltaQUDc  i8
	DeltaQUAc  i8
	DeltaQVDc  i8
	DeltaQVAc  i8
	qm_y       u8
	qm_u       u8
	qm_v       u8
}

pub type StdVideoAV1Segmentation = C.StdVideoAV1Segmentation

@[typedef]
pub struct C.StdVideoAV1Segmentation {
pub mut:
	FeatureEnabled [std_video_av1_max_segments]u8
	FeatureData    [std_video_av1_max_segments][std_video_av1_seg_lvl_max]i16
}

pub type StdVideoAV1TileInfoFlags = C.StdVideoAV1TileInfoFlags

@[typedef]
pub struct C.StdVideoAV1TileInfoFlags {
pub mut:
	uniform_tile_spacing_flag u32
	reserved                  u32
}

pub type StdVideoAV1TileInfo = C.StdVideoAV1TileInfo

@[typedef]
pub struct C.StdVideoAV1TileInfo {
pub mut:
	flags                   StdVideoAV1TileInfoFlags
	TileCols                u8
	TileRows                u8
	context_update_tile_id  u16
	tile_size_bytes_minus_1 u8
	reserved1               [7]u8
	pMiColStarts            &u16
	pMiRowStarts            &u16
	pWidthInSbsMinus1       &u16
	pHeightInSbsMinus1      &u16
}

pub type StdVideoAV1CDEF = C.StdVideoAV1CDEF

@[typedef]
pub struct C.StdVideoAV1CDEF {
pub mut:
	cdef_damping_minus_3 u8
	cdef_bits            u8
	cdef_y_pri_strength  [std_video_av1_max_cdef_filter_strengths]u8
	cdef_y_sec_strength  [std_video_av1_max_cdef_filter_strengths]u8
	cdef_uv_pri_strength [std_video_av1_max_cdef_filter_strengths]u8
	cdef_uv_sec_strength [std_video_av1_max_cdef_filter_strengths]u8
}

pub type StdVideoAV1LoopRestoration = C.StdVideoAV1LoopRestoration

@[typedef]
pub struct C.StdVideoAV1LoopRestoration {
pub mut:
	FrameRestorationType [std_video_av1_max_num_planes]StdVideoAV1FrameRestorationType
	LoopRestorationSize  [std_video_av1_max_num_planes]u16
}

pub type StdVideoAV1GlobalMotion = C.StdVideoAV1GlobalMotion

@[typedef]
pub struct C.StdVideoAV1GlobalMotion {
pub mut:
	GmType    [std_video_av1_num_ref_frames]u8
	gm_params [std_video_av1_num_ref_frames][std_video_av1_global_motion_params]i32
}

pub type StdVideoAV1FilmGrainFlags = C.StdVideoAV1FilmGrainFlags

@[typedef]
pub struct C.StdVideoAV1FilmGrainFlags {
pub mut:
	chroma_scaling_from_luma u32
	overlap_flag             u32
	clip_to_restricted_range u32
	update_grain             u32
	reserved                 u32
}

pub type StdVideoAV1FilmGrain = C.StdVideoAV1FilmGrain

@[typedef]
pub struct C.StdVideoAV1FilmGrain {
pub mut:
	flags                     StdVideoAV1FilmGrainFlags
	grain_scaling_minus_8     u8
	ar_coeff_lag              u8
	ar_coeff_shift_minus_6    u8
	grain_scale_shift         u8
	grain_seed                u16
	film_grain_params_ref_idx u8
	num_y_points              u8
	point_y_value             [std_video_av1_max_num_y_points]u8
	point_y_scaling           [std_video_av1_max_num_y_points]u8
	num_cb_points             u8
	point_cb_value            [std_video_av1_max_num_cb_points]u8
	point_cb_scaling          [std_video_av1_max_num_cb_points]u8
	num_cr_points             u8
	point_cr_value            [std_video_av1_max_num_cr_points]u8
	point_cr_scaling          [std_video_av1_max_num_cr_points]u8
	ar_coeffs_y_plus_128      [std_video_av1_max_num_pos_luma]i8
	ar_coeffs_cb_plus_128     [std_video_av1_max_num_pos_chroma]i8
	ar_coeffs_cr_plus_128     [std_video_av1_max_num_pos_chroma]i8
	cb_mult                   u8
	cb_luma_mult              u8
	cb_offset                 u16
	cr_mult                   u8
	cr_luma_mult              u8
	cr_offset                 u16
}

pub type StdVideoAV1SequenceHeaderFlags = C.StdVideoAV1SequenceHeaderFlags

@[typedef]
pub struct C.StdVideoAV1SequenceHeaderFlags {
pub mut:
	still_picture                      u32
	reduced_still_picture_header       u32
	use_128x128_superblock             u32
	enable_filter_intra                u32
	enable_intra_edge_filter           u32
	enable_interintra_compound         u32
	enable_masked_compound             u32
	enable_warped_motion               u32
	enable_dual_filter                 u32
	enable_order_hint                  u32
	enable_jnt_comp                    u32
	enable_ref_frame_mvs               u32
	frame_id_numbers_present_flag      u32
	enable_superres                    u32
	enable_cdef                        u32
	enable_restoration                 u32
	film_grain_params_present          u32
	timing_info_present_flag           u32
	initial_display_delay_present_flag u32
	reserved                           u32
}

pub type StdVideoAV1SequenceHeader = C.StdVideoAV1SequenceHeader

@[typedef]
pub struct C.StdVideoAV1SequenceHeader {
pub mut:
	flags                              StdVideoAV1SequenceHeaderFlags
	seq_profile                        StdVideoAV1Profile
	frame_width_bits_minus_1           u8
	frame_height_bits_minus_1          u8
	max_frame_width_minus_1            u16
	max_frame_height_minus_1           u16
	delta_frame_id_length_minus_2      u8
	additional_frame_id_length_minus_1 u8
	order_hint_bits_minus_1            u8
	seq_force_integer_mv               u8
	seq_force_screen_content_tools     u8
	reserved1                          [5]u8
	pColorConfig                       &StdVideoAV1ColorConfig
	pTimingInfo                        &StdVideoAV1TimingInfo
}

pub const std_vulkan_video_codec_av1_decode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_vulkan_video_codec_av1_decode_spec_version = std_vulkan_video_codec_av1_decode_api_version_1_0_0
pub const std_vulkan_video_codec_av1_decode_extension_name = c'VK_STD_vulkan_video_codec_av1_decode'

pub type StdVideoDecodeAV1PictureInfoFlags = C.StdVideoDecodeAV1PictureInfoFlags

@[typedef]
pub struct C.StdVideoDecodeAV1PictureInfoFlags {
pub mut:
	error_resilient_mode             u32
	disable_cdf_update               u32
	use_superres                     u32
	render_and_frame_size_different  u32
	allow_screen_content_tools       u32
	is_filter_switchable             u32
	force_integer_mv                 u32
	frame_size_override_flag         u32
	buffer_removal_time_present_flag u32
	allow_intrabc                    u32
	frame_refs_short_signaling       u32
	allow_high_precision_mv          u32
	is_motion_mode_switchable        u32
	use_ref_frame_mvs                u32
	disable_frame_end_update_cdf     u32
	allow_warped_motion              u32
	reduced_tx_set                   u32
	reference_select                 u32
	skip_mode_present                u32
	delta_q_present                  u32
	delta_lf_present                 u32
	delta_lf_multi                   u32
	segmentation_enabled             u32
	segmentation_update_map          u32
	segmentation_temporal_update     u32
	segmentation_update_data         u32
	UsesLr                           u32
	usesChromaLr                     u32
	apply_grain                      u32
	reserved                         u32
}

pub type StdVideoDecodeAV1PictureInfo = C.StdVideoDecodeAV1PictureInfo

@[typedef]
pub struct C.StdVideoDecodeAV1PictureInfo {
pub mut:
	flags                StdVideoDecodeAV1PictureInfoFlags
	frame_type           StdVideoAV1FrameType
	current_frame_id     u32
	OrderHint            u8
	primary_ref_frame    u8
	refresh_frame_flags  u8
	reserved1            u8
	interpolation_filter StdVideoAV1InterpolationFilter
	TxMode               StdVideoAV1TxMode
	delta_q_res          u8
	delta_lf_res         u8
	SkipModeFrame        [std_video_av1_skip_mode_frames]u8
	coded_denom          u8
	reserved2            [3]u8
	OrderHints           [std_video_av1_num_ref_frames]u8
	expectedFrameId      [std_video_av1_num_ref_frames]u32
	pTileInfo            &StdVideoAV1TileInfo
	pQuantization        &StdVideoAV1Quantization
	pSegmentation        &StdVideoAV1Segmentation
	pLoopFilter          &StdVideoAV1LoopFilter
	pCDEF                &StdVideoAV1CDEF
	pLoopRestoration     &StdVideoAV1LoopRestoration
	pGlobalMotion        &StdVideoAV1GlobalMotion
	pFilmGrain           &StdVideoAV1FilmGrain
}

pub type StdVideoDecodeAV1ReferenceInfoFlags = C.StdVideoDecodeAV1ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoDecodeAV1ReferenceInfoFlags {
pub mut:
	disable_frame_end_update_cdf u32
	segmentation_enabled         u32
	reserved                     u32
}

pub type StdVideoDecodeAV1ReferenceInfo = C.StdVideoDecodeAV1ReferenceInfo

@[typedef]
pub struct C.StdVideoDecodeAV1ReferenceInfo {
pub mut:
	flags            StdVideoDecodeAV1ReferenceInfoFlags
	frame_type       u8
	RefFrameSignBias u8
	OrderHint        u8
	SavedOrderHints  [std_video_av1_num_ref_frames]u8
}

pub const std_vulkan_video_codec_av1_encode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_vulkan_video_codec_av1_encode_spec_version = std_vulkan_video_codec_av1_encode_api_version_1_0_0
pub const std_vulkan_video_codec_av1_encode_extension_name = c'VK_STD_vulkan_video_codec_av1_encode'

pub type StdVideoEncodeAV1DecoderModelInfo = C.StdVideoEncodeAV1DecoderModelInfo

@[typedef]
pub struct C.StdVideoEncodeAV1DecoderModelInfo {
pub mut:
	buffer_delay_length_minus_1            u8
	buffer_removal_time_length_minus_1     u8
	frame_presentation_time_length_minus_1 u8
	reserved1                              u8
	num_units_in_decoding_tick             u32
}

pub type StdVideoEncodeAV1ExtensionHeader = C.StdVideoEncodeAV1ExtensionHeader

@[typedef]
pub struct C.StdVideoEncodeAV1ExtensionHeader {
pub mut:
	temporal_id u8
	spatial_id  u8
}

pub type StdVideoEncodeAV1OperatingPointInfoFlags = C.StdVideoEncodeAV1OperatingPointInfoFlags

@[typedef]
pub struct C.StdVideoEncodeAV1OperatingPointInfoFlags {
pub mut:
	decoder_model_present_for_this_op         u32
	low_delay_mode_flag                       u32
	initial_display_delay_present_for_this_op u32
	reserved                                  u32
}

pub type StdVideoEncodeAV1OperatingPointInfo = C.StdVideoEncodeAV1OperatingPointInfo

@[typedef]
pub struct C.StdVideoEncodeAV1OperatingPointInfo {
pub mut:
	flags                         StdVideoEncodeAV1OperatingPointInfoFlags
	operating_point_idc           u16
	seq_level_idx                 u8
	seq_tier                      u8
	decoder_buffer_delay          u32
	encoder_buffer_delay          u32
	initial_display_delay_minus_1 u8
}

pub type StdVideoEncodeAV1PictureInfoFlags = C.StdVideoEncodeAV1PictureInfoFlags

@[typedef]
pub struct C.StdVideoEncodeAV1PictureInfoFlags {
pub mut:
	error_resilient_mode             u32
	disable_cdf_update               u32
	use_superres                     u32
	render_and_frame_size_different  u32
	allow_screen_content_tools       u32
	is_filter_switchable             u32
	force_integer_mv                 u32
	frame_size_override_flag         u32
	buffer_removal_time_present_flag u32
	allow_intrabc                    u32
	frame_refs_short_signaling       u32
	allow_high_precision_mv          u32
	is_motion_mode_switchable        u32
	use_ref_frame_mvs                u32
	disable_frame_end_update_cdf     u32
	allow_warped_motion              u32
	reduced_tx_set                   u32
	skip_mode_present                u32
	delta_q_present                  u32
	delta_lf_present                 u32
	delta_lf_multi                   u32
	segmentation_enabled             u32
	segmentation_update_map          u32
	segmentation_temporal_update     u32
	segmentation_update_data         u32
	UsesLr                           u32
	usesChromaLr                     u32
	show_frame                       u32
	showable_frame                   u32
	reserved                         u32
}

pub type StdVideoEncodeAV1PictureInfo = C.StdVideoEncodeAV1PictureInfo

@[typedef]
pub struct C.StdVideoEncodeAV1PictureInfo {
pub mut:
	flags                   StdVideoEncodeAV1PictureInfoFlags
	frame_type              StdVideoAV1FrameType
	frame_presentation_time u32
	current_frame_id        u32
	order_hint              u8
	primary_ref_frame       u8
	refresh_frame_flags     u8
	coded_denom             u8
	render_width_minus_1    u16
	render_height_minus_1   u16
	interpolation_filter    StdVideoAV1InterpolationFilter
	TxMode                  StdVideoAV1TxMode
	delta_q_res             u8
	delta_lf_res            u8
	ref_order_hint          [std_video_av1_num_ref_frames]u8
	ref_frame_idx           [std_video_av1_refs_per_frame]i8
	reserved1               [3]u8
	delta_frame_id_minus_1  [std_video_av1_refs_per_frame]u32
	pTileInfo               &StdVideoAV1TileInfo
	pQuantization           &StdVideoAV1Quantization
	pSegmentation           &StdVideoAV1Segmentation
	pLoopFilter             &StdVideoAV1LoopFilter
	pCDEF                   &StdVideoAV1CDEF
	pLoopRestoration        &StdVideoAV1LoopRestoration
	pGlobalMotion           &StdVideoAV1GlobalMotion
	pExtensionHeader        &StdVideoEncodeAV1ExtensionHeader
	pBufferRemovalTimes     &u32
}

pub type StdVideoEncodeAV1ReferenceInfoFlags = C.StdVideoEncodeAV1ReferenceInfoFlags

@[typedef]
pub struct C.StdVideoEncodeAV1ReferenceInfoFlags {
pub mut:
	disable_frame_end_update_cdf u32
	segmentation_enabled         u32
	reserved                     u32
}

pub type StdVideoEncodeAV1ReferenceInfo = C.StdVideoEncodeAV1ReferenceInfo

@[typedef]
pub struct C.StdVideoEncodeAV1ReferenceInfo {
pub mut:
	flags            StdVideoEncodeAV1ReferenceInfoFlags
	RefFrameId       u32
	frame_type       StdVideoAV1FrameType
	OrderHint        u8
	reserved1        [3]u8
	pExtensionHeader &StdVideoEncodeAV1ExtensionHeader
}

pub const std_video_vp9_max_ref_frames = u32(4)
pub const std_video_vp9_loop_filter_adjustments = u32(2)
pub const std_video_vp9_max_segmentation_tree_probs = u32(7)
pub const std_video_vp9_max_segmentation_pred_prob = u32(3)
pub const std_video_vp9_max_segments = u32(8)
pub const std_video_vp9_seg_lvl_max = u32(4)
pub const std_video_vp9_num_ref_frames = u32(8)
pub const std_video_vp9_refs_per_frame = u32(3)

pub enum StdVideoVP9Profile as u32 {
	_0      = 0
	_1      = 1
	_2      = 2
	_3      = 3
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoVP9Level as u32 {
	_1_0    = 0
	_1_1    = 1
	_2_0    = 2
	_2_1    = 3
	_3_0    = 4
	_3_1    = 5
	_4_0    = 6
	_4_1    = 7
	_5_0    = 8
	_5_1    = 9
	_5_2    = 10
	_6_0    = 11
	_6_1    = 12
	_6_2    = 13
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoVP9FrameType as u32 {
	key     = 0
	non_key = 1
	invalid = u32(0x7FFFFFFF)
}

pub enum StdVideoVP9ReferenceName as u32 {
	intra_frame  = 0
	last_frame   = 1
	golden_frame = 2
	altref_frame = 3
	invalid      = u32(0x7FFFFFFF)
}

pub enum StdVideoVP9InterpolationFilter as u32 {
	eighttap        = 0
	eighttap_smooth = 1
	eighttap_sharp  = 2
	bilinear        = 3
	switchable      = 4
	invalid         = u32(0x7FFFFFFF)
}

pub enum StdVideoVP9ColorSpace as u32 {
	unknown  = 0
	bt601    = 1
	bt709    = 2
	smpte170 = 3
	smpte240 = 4
	bt2020   = 5
	reserved = 6
	rgb      = 7
	invalid  = u32(0x7FFFFFFF)
}
pub type StdVideoVP9ColorConfigFlags = C.StdVideoVP9ColorConfigFlags

@[typedef]
pub struct C.StdVideoVP9ColorConfigFlags {
pub mut:
	color_range u32
	reserved    u32
}

pub type StdVideoVP9ColorConfig = C.StdVideoVP9ColorConfig

@[typedef]
pub struct C.StdVideoVP9ColorConfig {
pub mut:
	flags         StdVideoVP9ColorConfigFlags
	BitDepth      u8
	subsampling_x u8
	subsampling_y u8
	reserved1     u8
	color_space   StdVideoVP9ColorSpace
}

pub type StdVideoVP9LoopFilterFlags = C.StdVideoVP9LoopFilterFlags

@[typedef]
pub struct C.StdVideoVP9LoopFilterFlags {
pub mut:
	loop_filter_delta_enabled u32
	loop_filter_delta_update  u32
	reserved                  u32
}

pub type StdVideoVP9LoopFilter = C.StdVideoVP9LoopFilter

@[typedef]
pub struct C.StdVideoVP9LoopFilter {
pub mut:
	flags                   StdVideoVP9LoopFilterFlags
	loop_filter_level       u8
	loop_filter_sharpness   u8
	update_ref_delta        u8
	loop_filter_ref_deltas  [std_video_vp9_max_ref_frames]i8
	update_mode_delta       u8
	loop_filter_mode_deltas [std_video_vp9_loop_filter_adjustments]i8
}

pub type StdVideoVP9SegmentationFlags = C.StdVideoVP9SegmentationFlags

@[typedef]
pub struct C.StdVideoVP9SegmentationFlags {
pub mut:
	segmentation_update_map          u32
	segmentation_temporal_update     u32
	segmentation_update_data         u32
	segmentation_abs_or_delta_update u32
	reserved                         u32
}

pub type StdVideoVP9Segmentation = C.StdVideoVP9Segmentation

@[typedef]
pub struct C.StdVideoVP9Segmentation {
pub mut:
	flags                   StdVideoVP9SegmentationFlags
	segmentation_tree_probs [std_video_vp9_max_segmentation_tree_probs]u8
	segmentation_pred_prob  [std_video_vp9_max_segmentation_pred_prob]u8
	FeatureEnabled          [std_video_vp9_max_segments]u8
	FeatureData             [std_video_vp9_max_segments][std_video_vp9_seg_lvl_max]i16
}

pub const std_vulkan_video_codec_vp9_decode_api_version_1_0_0 = make_video_std_version(1,
	0, 0)
pub const std_vulkan_video_codec_vp9_decode_spec_version = std_vulkan_video_codec_vp9_decode_api_version_1_0_0
pub const std_vulkan_video_codec_vp9_decode_extension_name = c'VK_STD_vulkan_video_codec_vp9_decode'

pub type StdVideoDecodeVP9PictureInfoFlags = C.StdVideoDecodeVP9PictureInfoFlags

@[typedef]
pub struct C.StdVideoDecodeVP9PictureInfoFlags {
pub mut:
	error_resilient_mode         u32
	intra_only                   u32
	allow_high_precision_mv      u32
	refresh_frame_context        u32
	frame_parallel_decoding_mode u32
	segmentation_enabled         u32
	show_frame                   u32
	UsePrevFrameMvs              u32
	reserved                     u32
}

pub type StdVideoDecodeVP9PictureInfo = C.StdVideoDecodeVP9PictureInfo

@[typedef]
pub struct C.StdVideoDecodeVP9PictureInfo {
pub mut:
	flags                    StdVideoDecodeVP9PictureInfoFlags
	profile                  StdVideoVP9Profile
	frame_type               StdVideoVP9FrameType
	frame_context_idx        u8
	reset_frame_context      u8
	refresh_frame_flags      u8
	ref_frame_sign_bias_mask u8
	interpolation_filter     StdVideoVP9InterpolationFilter
	base_q_idx               u8
	delta_q_y_dc             i8
	delta_q_uv_dc            i8
	delta_q_uv_ac            i8
	tile_cols_log2           u8
	tile_rows_log2           u8
	reserved1                [3]u16
	pColorConfig             &StdVideoVP9ColorConfig
	pLoopFilter              &StdVideoVP9LoopFilter
	pSegmentation            &StdVideoVP9Segmentation
}
