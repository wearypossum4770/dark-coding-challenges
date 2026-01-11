const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn maxIceCream(comptime T: type, allocator: Allocator, costs: []const T, coins: T) ?T {
    var remaining = coins;
    var cones: T = 0;
    const result = allocator.dupe(T, costs) catch return null;
    std.mem.sort(T, result, {}, std.sort.asc(T));
    defer allocator.free(result);
    for (result) |cost| {
        if (cost <= remaining) {
            remaining -= cost;
            cones += 1;
        }
    }
    return cones;
}
