const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;

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

test "reverse normal word" {
    var input = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    const output = [_]u8{ 'o', 'l', 'l', 'e', 'h' };
    reverseString(&input);
    try expectEqualSlices(u8, &output, &input);
}
test "ordered characters are reversed" {
    var input = [_]u8{ 'a', 'b', 'c', 'd' };
    const output = [_]u8{ 'd', 'c', 'b', 'a' };
    reverseString(&input);
    try expectEqualSlices(u8, &output, &input);
}
test "single character" {
    var input = [_]u8{'z'};
    const output = [_]u8{'z'};
    reverseString(&input);
    try expectEqualSlices(u8, &output, &input);
}
test "empty array/slice" {
    var input = [_]u8{};
    const output = [_]u8{};
    reverseString(&input);
    try expectEqualSlices(u8, &output, &input);
}
