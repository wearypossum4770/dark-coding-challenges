const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn stringIsSubsequence(s: []const u8, t: []const u8) bool {
    var left: usize = 0;
    var right: usize = 0;
    while (left < s.len and right < t.len) {
        if (s[left] == t[right]) {
            left += 1;
        }
        right += 1;
    }
    return left == s.len;
}
