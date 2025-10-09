const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const AutoHashMap = std.hash_map.AutoHashMap;
pub fn distributeCandies(comptime T: type, allocator: Allocator, candyType: []const T) ?u32 {
    var set = AutoHashMap(@TypeOf(candyType[0]), bool).init(allocator);
    defer set.deinit();
    for (candyType) |candy| {
        if (!set.contains(candy)) {
            set.put(candy, true) catch return null;
        }
    }
    return @intCast(@min(set.count(), candyType.len / 2));
}
