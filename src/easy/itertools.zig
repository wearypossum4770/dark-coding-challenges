const std = @import("std");

const Allocator = std.mem.Allocator;

const expectEqualSlices = std.testing.expectEqualSlices;

pub fn allocateArray(comptime T: type, allocator: Allocator, size: usize) ?[]T {
    var result = allocator.alloc(T, size) catch return null;
    var index: usize = 0;
    while (index < result.len) : (index += 1) {
        result[index] = 1;
    }
    return result;
}
pub fn createMatrix(comptime T: type, allocator: Allocator, size: usize) ?[][]T {
    var result = allocator.alloc([]T, size) catch return null;
    for (result, 0..) |_, i| {
        var inner = allocateArray(T, allocator, i + 1) orelse {
            for (0..i) |j| {
                allocator.free(result[j]);
            }
            allocator.free(result);
            return null;
        };
        inner[0] = 1;
        result[i] = inner;
    }
    return result;
}
test "array allocation size 1" {
    const size: usize = 1;
    const expected = [_]i32{1};
    const allocator = std.testing.allocator;
    const result = allocateArray(@TypeOf(expected[0]), allocator, size);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(expected[0]), &expected, actual);
    } else return error.SkipZigTest;
}

test "array allocation size 20" {
    const size: usize = 20;
    const expected = [_]i32{1} ** 20;
    const allocator = std.testing.allocator;
    const result = allocateArray(@TypeOf(expected[0]), allocator, size);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(expected[0]), &expected, actual);
    } else return error.SkipZigTest;
}

test "matrix allocation size 1" {
    const size: usize = 1;
    const expectedMatrix = [_][]const i32{
        &[_]i32{1},
    };
    const allocator = std.testing.allocator;
    const matrix = createMatrix(@TypeOf(expectedMatrix[0][0]), allocator, size);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}

test "matrix allocation size 5" {
    const size: usize = 5;
    const expectedMatrix = [_][]const i32{
        &[_]i32{1},
        &[_]i32{ 1, 1 },
        &[_]i32{ 1, 1, 1 },
        &[_]i32{ 1, 1, 1, 1 },
        &[_]i32{ 1, 1, 1, 1, 1 },
    };
    const allocator = std.testing.allocator;
    const matrix = createMatrix(@TypeOf(expectedMatrix[0][0]), allocator, size);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}

