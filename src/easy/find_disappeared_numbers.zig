const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn findDisappearedNumbers(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var count = nums.len;
    var result = allocator.alloc(T, count) catch return null;
    var index: usize = 0;

    @memset(result, 0);
    defer allocator.free(result);

    for (nums) |num| {
        const value: usize = @intCast(num);
        if (result[value - 1] == 0) {
            count -= 1;
        }
        result[value - 1] = num;
    }
    var target = allocator.alloc(T, count) catch return null;
    for (result, 0..) |num, i| {
        if (num != 0) continue;
        const value: T = @intCast(i);
        target[index] = value + 1;
        index += 1;
    }
    return target;
}
