const std = @import("std");

const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

pub fn processBackSpaceCompare(allocator: Allocator, text: []const u8) ?[]const u8 {
    var buffer: ArrayList(u8) = .empty;
    defer buffer.deinit(allocator);
    for (text) |char| {
        if (char == '#') {
            _ = buffer.pop();
        } else {
            buffer.append(allocator, char) catch return null;
        }
    }
    return allocator.dupe(u8, buffer.items) catch return null;
}
pub fn backspaceCompare(allocator: Allocator, s: []const u8, t: []const u8) bool {
    const first = processBackSpaceCompare(allocator, s) orelse return false;
    defer allocator.free(first);
    const second = processBackSpaceCompare(allocator, t) orelse return false;
    defer allocator.free(second);
    return std.mem.eql(u8, first, second);
}
