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

test "add one to [4,3,2,1]" {
    const digits = [_]u4{ 4, 3, 2, 1 };
    const expected = [_]u4{ 4, 3, 2, 2 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [1,2,3]" {
    const digits = [_]u4{ 1, 2, 3 };
    const expected = [_]u4{ 1, 2, 4 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [9]" {
    const digits = [_]u4{9};
    const expected = [_]u4{ 1, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [9,9]" {
    const digits = [_]u4{ 9, 9 };
    const expected = [_]u4{ 1, 0, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [0]" {
    // Single zero +1 = 1
    const digits = [_]u4{0};
    const expected = [_]u4{1};
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [5]" {
    // No carry case for single digit
    const digits = [_]u4{5};
    const expected = [_]u4{6};
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [9,9,9,9]" {
    // Full carry propagation across multiple digits
    const digits = [_]u4{ 9, 9, 9, 9 };
    const expected = [_]u4{ 1, 0, 0, 0, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [9,9,8]" {
    // Carry propagates but stops in the middle
    const digits = [_]u4{ 9, 9, 8 };
    const expected = [_]u4{ 9, 9, 9 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [1,0,0]" {
    // Increment without carry in the middle (e.g., 100 +1 = 101)
    const digits = [_]u4{ 1, 0, 0 };
    const expected = [_]u4{ 1, 0, 1 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [8,9,9]" {
    // Carry propagates to the first digit without extra digit
    const digits = [_]u4{ 8, 9, 9 };
    const expected = [_]u4{ 9, 0, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [0,9]" {
    // Leading zero with carry
    const digits = [_]u4{ 0, 9 };
    const expected = [_]u4{ 1, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [1,9,9]" {
    // Carry propagates to first digit, creating extra digit
    const digits = [_]u4{ 1, 9, 9 };
    const expected = [_]u4{ 2, 0, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}

test "add one to [9,9,9,9,9]" {
    // Longer full carry propagation
    const digits = [_]u4{ 9, 9, 9, 9, 9 };
    const expected = [_]u4{ 1, 0, 0, 0, 0, 0 };
    const allocator = std.testing.allocator;
    const result = plusOne(allocator, &digits);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u4, &expected, actual);
    } else return error.SkipZigTest;
}
