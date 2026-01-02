const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn rotateString(allocator: Allocator, s: []const u8, goal: []const u8) ?bool {
    if (s.len != goal.len) return false;
    if (s.len == 0 or goal.len == 0) return true;
    var slices = [_][]const u8{ s, s };
    const result = std.mem.concat(allocator, u8, &slices) catch return null;
    defer allocator.free(result);
    return std.mem.containsAtLeast(u8, result, 1, goal);
}
