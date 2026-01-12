const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn relativeSortArray(comptime T: type, allocator: Allocator, arr1: []const T, arr2: []const T) ?[]const T {
    var freq = allocator.alloc(T, 1_001) catch return null;
    var result = allocator.alloc(T, arr1.len) catch return null;
    var index: usize = 0;
    defer allocator.free(freq);
    @memset(freq, 0);
    for (arr1) |num| {
        const position: usize = @intCast(num);
        freq[position] += 1;
    }
    for (arr2) |num| {
        const position: usize = @intCast(num);
        var count = freq[position];
        while (count > 0) : (count -= 1) {
            freq[position] -= 1;
            result[index] = num;
            index += 1;
        }
    }
    for (freq, 0..) |num, i| {
        const position: T = @intCast(i);
        var count = num;
        while (count > 0) : (count -= 1) {
            result[index] = position;
            index += 1;
        }
    }
    return result;
}
