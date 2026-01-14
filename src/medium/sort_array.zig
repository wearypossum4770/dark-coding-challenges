const std = @import("std");

const Allocator = std.mem.Allocator;
const AutoHashMap = std.AutoHashMap;

pub fn sortArray(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    const result = allocator.alloc(T, nums.len) catch return null;
    std.mem.copyBackwards(T, result, nums);
    std.mem.sort(T, result, {}, std.sort.asc(T));
    return result;
}
