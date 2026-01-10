const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn arrayPairSum(comptime T: type, allocator: Allocator, nums: []const T) ?T {
    var total: T = 0;
    const arr = allocator.dupe(T, nums) catch return null;
    defer allocator.free(arr);
    std.mem.sort(T, arr, {}, std.sort.asc(T));
    std.mem.reverse(T, arr);
    var index: usize = 0;
    while (index < nums.len - 1) : (index += 2) {
        total += @min(arr[index], arr[index + 1]);
    }
    return total;
}
