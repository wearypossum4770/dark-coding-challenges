const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;
fn initialSize(digits: []const u4) usize {
    if (digits.len == 0) return 1;
    return digits.len;
}
pub fn plusOne(allocator: Allocator, digits: []const u4) ?[]const u4 {
    var result = allocator.alloc(u4, initialSize(digits)) catch return null;
    @memset(result, 0);
    var index: usize = digits.len;
    var remainder: u4 = 1;
    while (index > 0) {
        index -= 1;
        result[index] = digits[index] + remainder;
        if (result[index] > 9) {
            remainder = 1;
            result[index] = 0;
            continue;
        }
        remainder = 0;
    }

    if (remainder > 0) {
        defer allocator.free(result);
        var copy = allocator.alloc(u4, digits.len + 1) catch return null;
        copy[0] = 1;
        copy[1] = 0;
        for (copy, 0..) |_, i| {
            if (i > 1) {
                copy[i] = result[i - 2];
            }
        }
        return copy;
    }
    return result;
}
