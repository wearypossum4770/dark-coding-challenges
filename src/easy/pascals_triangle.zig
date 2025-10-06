const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

const IterTools = @import("itertools.zig");

pub fn pascalsTriangle(comptime T: type, allocator: Allocator, numRows: i32) ?[][]T {
    if (numRows <= 0) return null;

    const size: usize = @intCast(numRows);
    const result = IterTools.createMatrix(T, allocator, size) orelse return null;
    var i: usize = 2;
    if (numRows == 1) return result;
    while (i < result.len) : (i += 1) {
        var j: usize = 1;
        while (j < result[i].len - 1) : (j += 1) {
            result[i][j] = result[i - 1][j - 1] + result[i - 1][j];
        }
    }
    return result;
}

test "creating a pascal triangle of size 1" {
    const numRows: i32 = 1;
    const expectedMatrix = [_][]const i32{
        &[_]i32{1},
    };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}
test "creating a pascal triangle of size 2" {
    const numRows: i32 = 2;
    const expectedMatrix = [_][]const i32{ &[_]i32{1}, &[_]i32{ 1, 1 } };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}
test "creating a pascal triangle of size 3" {
    const numRows: i32 = 3;
    const expectedMatrix = [_][]const i32{ &[_]i32{1}, &[_]i32{ 1, 1 }, &[_]i32{ 1, 2, 1 } };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}
test "creating a pascal triangle of size 4" {
    const numRows: i32 = 4;
    const expectedMatrix = [_][]const i32{ &[_]i32{1}, &[_]i32{ 1, 1 }, &[_]i32{ 1, 2, 1 }, &[_]i32{ 1, 3, 3, 1 } };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}

test "creating a pascal triangle of size 5" {
    const numRows: i32 = 5;
    const expectedMatrix = [_][]const i32{
        &[_]i32{1},
        &[_]i32{ 1, 1 },
        &[_]i32{ 1, 2, 1 },
        &[_]i32{ 1, 3, 3, 1 },
        &[_]i32{ 1, 4, 6, 4, 1 },
    };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}

test "creating a pascal triangle of size 6" {
    const numRows: i32 = 6;
    const expectedMatrix = [_][]const i32{ &[_]i32{1}, &[_]i32{ 1, 1 }, &[_]i32{ 1, 2, 1 }, &[_]i32{ 1, 3, 3, 1 }, &[_]i32{ 1, 4, 6, 4, 1 }, &[_]i32{ 1, 5, 10, 10, 5, 1 } };
    const allocator = std.testing.allocator;
    const matrix = pascalsTriangle(@TypeOf(expectedMatrix[0][0]), allocator, numRows);
    if (matrix) |result| {
        for (result, 0..) |actual, i| {
            const expected = expectedMatrix[i];
            defer allocator.free(actual);
            try expectEqualSlices(@TypeOf(expected[i]), expected, actual);
        }
        defer allocator.free(result);
    } else return error.SkipZigTest;
}
