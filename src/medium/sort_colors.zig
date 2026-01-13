const std = @import("std");

const Allocator = std.mem.Allocator;
const AutoHashMap = std.AutoHashMap;

pub fn sortColors(comptime T: type, allocator: Allocator, nums: []T) void {
    const increment: usize = 1;
    var freq = AutoHashMap(usize, usize).init(allocator);
    defer freq.deinit();
    var index: usize = 0;
    for (nums) |num| {
        const value: usize = @intCast(num);
        if (freq.getEntry(value)) |entry| {
            entry.value_ptr.* += increment;
        } else {
            freq.put(value, 1) catch return;
        }
    }
    for (0..3) |i| {
        var count = freq.get(i) orelse 0;
        while (count > 0) : (count -= 1) {
            const value: T = @intCast(i);
            nums[index] = value;
            index += 1;
        }
    }
}
