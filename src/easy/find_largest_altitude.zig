const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn findLargestAltitude(comptime T: type, allocator: Allocator, gain: []const T) ?T {
    var result = allocator.alloc(T, gain.len + 1) catch return null;
    @memset(result, 0);
    var altitude: T = 0;
    for (gain, 0..) |height, i| {
        altitude += height;
        result[i] = altitude;
    }
    defer allocator.free(result);
    return std.mem.max(T, result);
}
