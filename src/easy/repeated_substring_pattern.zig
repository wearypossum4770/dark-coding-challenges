const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn repeatedSubstringPattern(allocator: Allocator, s: []const u8) ?bool {
    var slices = [_][]const u8{ s, s };
    const result = std.mem.concat(allocator, u8, &slices) catch return null;
    defer allocator.free(result);
    return std.mem.containsAtLeast(u8, result[1 .. s.len * 2 - 1], 1, s);
}
