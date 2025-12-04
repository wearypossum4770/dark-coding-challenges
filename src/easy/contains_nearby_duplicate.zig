const std = @import("std");

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
