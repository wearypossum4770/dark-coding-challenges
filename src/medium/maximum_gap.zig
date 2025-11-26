const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn maximumGap(comptime T: type, allocator: Allocator, nums: []const T) ?T {
    if (nums.len < 2) return 0;

    const arr = allocator.alloc(T, nums.len) catch return null;
    defer allocator.free(arr);
    std.mem.copyBackwards(T, arr, nums);
    std.mem.sort(T, arr, {}, std.sort.asc(T));
    var result: T = arr[1] - arr[0];
    var index: usize = 1;
    while (index < arr.len - 1) : (index += 1) {
        result = @max(result, arr[index + 1] - arr[index]);
    }

    return result;
}
