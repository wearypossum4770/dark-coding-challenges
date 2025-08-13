const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;
const MathTools = @import("./math_tools.zig");

const Allocator = std.mem.Allocator;

pub fn addBinary(allocator: Allocator, a: []const u8, b: []const u8) ?[]const u8 {
    const max = MathTools.maxValue(usize, a.len, b.len);
    var target = allocator.alloc(u8, max + 1) catch return null;
    var i = a.len;
    var j = b.len;
    var k = target.len;
    var carry: u8 = 0;

    while (i > 0 or j > 0 or carry > 0) {
        var sum: u8 = carry;

        if (i > 0) {
            i -= 1;
            sum += MathTools.asciiAsDigit(a[i]);
        }
        if (j > 0) {
            j -= 1;
            sum += MathTools.asciiAsDigit(b[j]);
        }

        k -= 1;
        target[k] = MathTools.digitAsAscii(@mod(sum, 2));
        carry = @divFloor(sum, 2);
    }
    return target[k..];
}

test "adding 11 to 1 equals 100" {
    const a = "11";
    const b = "1";
    const expected = "100";
    const allocator = std.testing.allocator;
    const result = addBinary(allocator, a, b);
    if (result) |actual| {
        try expectEqualSlices(u8, expected, actual);
        defer allocator.free(actual);
    } else return error.SkipZigTest;
}
test "adding 1010 to 1011 equals 10101" {
    const a = "1010";
    const b = "1011";
    const expected = "10101";
    const allocator = std.testing.allocator;
    const result = addBinary(allocator, a, b);
    if (result) |actual| {
        try expectEqualSlices(u8, expected, actual);
        defer allocator.free(actual);
    } else return error.SkipZigTest;
}
