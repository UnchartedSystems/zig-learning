const std = @import("std");

pub fn main() !void {
	const file = try std.fs.cwd().openFile("day1.txt", .{});
	const maxSize = 1000000;
	
	var buffer: [maxSize]u8 = undefined;
	var fba = std.heap.FixedBufferAllocator.init(&buffer);
	const allocator = fba.allocator();

	const text = try file.readToEndAlloc(allocator, maxSize);
	_ = text;
	var utf8 = (try std.unicode.Utf8View.init("hello there")).iterator();
	while (utf8.nextCodepointSlice()) |codepoint| {
		std.debug.print("got codepoint {s}\n", .{codepoint});
	}
}
