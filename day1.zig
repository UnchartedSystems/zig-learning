const std = @import("std");

pub fn main() !void {
	const file = try std.fs.cwd().openFile("day1.txt", .{});
	const max_size = 1000000;
	
	var buffer: [max_size]u8 = undefined;
	var fba = std.heap.FixedBufferAllocator.init(&buffer);
	const allocator = fba.allocator();

	const text = try file.readToEndAlloc(allocator, max_size);
	_ = try std.io.getStdOut().writer().write(text);
}
