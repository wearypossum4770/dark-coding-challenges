const std = @import("std");

pub fn reverseString(s: []u8) void {
    if (s.len == 0) return;
    var left: usize = 0;
    var right: usize = s.len - 1;
    while (left < right) {
        const temp = s[left];
        s[left] = s[right];
        s[right] = temp;
        left += 1;
        right -= 1;
    }
}
