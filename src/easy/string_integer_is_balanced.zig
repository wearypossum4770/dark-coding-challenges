const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn stringIntegerIsBalanced(num: []const u8) bool {
    var even: usize = 0;
    var odd: usize = 0;
    for (num, 0..) |n, i| {
        const digit = n - '0';
        if (@mod(i, 2) == 0) {
            even += digit;
        } else {
            odd += digit;
        }
    }
    return even == odd;
}
