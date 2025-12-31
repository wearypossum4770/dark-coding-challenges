const std = @import("std");

const expectEqual = std.testing.expectEqual;

const minInt = std.math.minInt;

pub fn thirdMax(comptime T: type, nums: []const T) T {
    var first: T = minInt(T);
    var second = first;
    var third = first;
    for (nums) |n| {
        if (first == n) continue;
        if (first < n) {
            third = second;
            second = first;
            first = n;
        } else if (second < n and first > n) {
            third = second;
            second = n;
        } else if (third < n and second > n) {
            third = n;
        }
    }
    return if (third != minInt(T)) third else first;
}
