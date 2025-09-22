const std = @import("std");

const expectEqual = std.testing.expectEqual;

const AutoHashMap = std.AutoHashMap;
pub fn arrayContainsDuplicate(comptime T: type, nums: []const T) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var set = AutoHashMap(T, bool).init(allocator);
    defer {
        set.deinit();
        _ = gpa.deinit();
    }
    for (nums) |n| {
        if (set.contains(n)) return true;
        set.put(n, true) catch return true;
    }
    return false;
}
