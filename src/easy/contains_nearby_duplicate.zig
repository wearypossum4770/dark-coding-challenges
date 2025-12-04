const std = @import("std");

const expectEqual = std.testing.expectEqual;

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

test "distinct indices whose difference is 3 in {1, 2, 3, 1} backed by array" {
    const nums = [_]i32{ 1, 2, 3, 1 };
    const k: @TypeOf(nums[0]) = 3;
    const expected = true;
    const actual = containsNearbyDuplicateArrayBacked(@TypeOf(nums[0]), &nums, k);
    try expectEqual(expected, actual);
}
