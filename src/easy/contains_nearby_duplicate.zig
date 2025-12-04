const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const AutoHashmap = std.hash_map.AutoHashMap;

pub fn containsNearbyDuplicateArrayBacked(comptime T: type, nums: []const T, k: T) bool {
    const maxValue: usize = 100_001;
    var lastSeen = [_]usize{0} ** maxValue;
    for (nums, 0..) |num, i| {
        const n: usize = @intCast(num);
        if (lastSeen[n] != -1 and i - lastSeen[n] <= k) return true;
        lastSeen[n] = i;
    }
    return false;
}
pub fn containsNearbyDuplicate(comptime T: type, allocator: Allocator, nums: []const T, k: T) ?bool {
    var seen = AutoHashmap(T, usize).init(allocator);
    defer seen.deinit();
    for (nums, 0..) |num, i| {
        if (seen.get(num)) |n| {
            if (@abs(i - n) <= k) return true;
        }
        seen.put(num, i) catch return null;
    }
    return false;
}

test "distinct indices whose difference is 3 in {1, 2, 3, 1} backed by array" {
    const nums = [_]i32{ 1, 2, 3, 1 };
    const k: @TypeOf(nums[0]) = 3;
    const expected = true;
    const actual = containsNearbyDuplicateArrayBacked(@TypeOf(nums[0]), &nums, k);
    try expectEqual(expected, actual);
}
