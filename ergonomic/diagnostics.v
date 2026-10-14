// Optional debug labels and timestamp queries. Synchronization remains explicit.
module ergonomic

import antono2.vulkan as vk

pub struct DebugLabels {
	begin vk.PFN_vkCmdBeginDebugUtilsLabelEXT @[required]
	end   vk.PFN_vkCmdEndDebugUtilsLabelEXT   @[required]
}

// Enable VK_EXT_debug_utils on the instance before loading these device commands.
pub fn (device &OwnedDevice) debug_labels() !DebugLabels {
	begin := unsafe {
		vk.PFN_vkCmdBeginDebugUtilsLabelEXT(vk.get_device_proc_addr(device.handle,
			c'vkCmdBeginDebugUtilsLabelEXT'))
	}
	end := unsafe {
		vk.PFN_vkCmdEndDebugUtilsLabelEXT(vk.get_device_proc_addr(device.handle,
			c'vkCmdEndDebugUtilsLabelEXT'))
	}
	if isnil(begin) || isnil(end) { return error('enable VK_EXT_debug_utils to use command labels') }
	return DebugLabels{
		begin: begin
		end:   end
	}
}

pub fn (labels DebugLabels) begin_label(command vk.CommandBuffer, name string, color [4]f32) {
	info := vk.DebugUtilsLabelEXT{
		pLabelName: name.str
		color:      color
	}
	labels.begin(command, &info)
}

pub fn (labels DebugLabels) end_label(command vk.CommandBuffer) {
	labels.end(command)
}

@[nocopy]
pub struct TimestampQueries {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
pub:
	count      u32
	valid_bits u32
	period_ns  f32
pub mut:
	handle vk.QueryPool
}

pub struct TimestampSample {
pub:
	ticks     u64
	available bool
}

// Query support is checked on the selected device queue family.
pub fn (device &OwnedDevice) new_timestamp_queries(count u32) !&TimestampQueries {
	families := device.physical_device.queue_families()
	bits := families[int(device.queue.family_index)].properties.timestampValidBits
	if count == 0 || count > u32(max_int / 2) || bits == 0 {
		return error('invalid timestamp count or queue lacks timestamp support')
	}
	info := vk.QueryPoolCreateInfo{
		queryType:  .timestamp
		queryCount: count
	}
	mut handle := vk.QueryPool(unsafe { nil })
	require_success(vk.create_query_pool(device.handle, &info, allocator_ptr(device.allocator),
		&handle), 'vkCreateQueryPool(timestamps)')!
	return &TimestampQueries{
		device:     device.handle
		allocator:  device.allocator
		handle:     handle
		count:      count
		valid_bits: bits
		period_ns:  device.physical_device.properties.limits.timestampPeriod
	}
}

// Record reset before writes; don't reset/reuse queries still in flight.
pub fn (queries &TimestampQueries) reset(command vk.CommandBuffer) ! {
	if isnil(queries.handle) { return error('timestamp queries are destroyed') }
	vk.cmd_reset_query_pool(command, queries.handle, 0, queries.count)
}

pub fn (queries &TimestampQueries) write(command vk.CommandBuffer, stage vk.PipelineStageFlagBits, index u32) ! {
	if isnil(queries.handle) || index >= queries.count {
		return error('invalid timestamp query index')
	}
	vk.cmd_write_timestamp(command, stage, queries.handle, index)
}

// Nonblocking result retrieval. Unavailable samples must not be used for timing.
pub fn (queries &TimestampQueries) read() ![]TimestampSample {
	if isnil(queries.handle) { return error('timestamp queries are destroyed') }
	mut data := []u64{len: int(queries.count) * 2}
	flags := u32(vk.QueryResultFlagBits._64) | u32(vk.QueryResultFlagBits.with_availability)
	status := vk.get_query_pool_results(queries.device, queries.handle, 0, queries.count,
		usize(data.len) * 8, data.data, 16, flags)
	if status !in [.success, .not_ready] { require_success(status, 'vkGetQueryPoolResults')! }
	mut result := []TimestampSample{cap: int(queries.count)}
	for i in 0 .. int(queries.count) {
		result << TimestampSample{
			ticks:     data[i * 2]
			available: data[i * 2 + 1] != 0
		}
	}
	return result
}

// Handles one counter wrap. Samples must come from this pool and one clock domain.
pub fn (queries &TimestampQueries) elapsed_ns(start TimestampSample, end TimestampSample) !f64 {
	if !start.available || !end.available { return error('timestamp samples are not available') }
	mask := if queries.valid_bits == 64 { ~u64(0) } else { (u64(1) << queries.valid_bits) - 1 }
	return f64((end.ticks - start.ticks) & mask) * f64(queries.period_ns)
}

pub fn (mut queries TimestampQueries) destroy() {
	if !isnil(queries.handle) {
		vk.destroy_query_pool(queries.device, queries.handle, allocator_ptr(queries.allocator))
		queries.handle = unsafe { nil }
	}
}
