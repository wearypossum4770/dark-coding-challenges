const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const minInt = std.math.minInt;
pub fn secondLargest(comptime T: type, nums: []T) T {
    var first: T = minInt(T);
    var second: T = first;
    for (nums) |n| {
        if (first < n) {
            second = first;
            first = n;
        } else if (second < n and first > n) {
            second = n;
        }
    }
    return second;
}
