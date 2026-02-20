const std = @import("std");

const Allocator = std.mem.Allocator;
const AutoHashMap = std.hash_map.AutoHashMap;

pub fn containsDuplicate(comptime T: type, allocator: Allocator, nums: []const T) bool {
    var unique = AutoHashMap(T, bool).init(allocator);
    defer unique.deinit();
    for (nums) |n| {
        if (unique.contains(n)) return true;
        unique.put(n, true) catch return false;
    }
    return false;
}
