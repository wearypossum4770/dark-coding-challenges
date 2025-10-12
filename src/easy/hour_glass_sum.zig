const std = @import("std");

const negative_inf = -std.math.inf(f64);

const expectEqual = std.testing.expectEqual;

pub fn hourGlassSum(comptime T: type, matrix: [][]const T) i32 {
    var max: f32 = negative_inf;
    for (matrix[0 .. matrix.len - 2], 0..) |row, i| {
        for (row[0 .. row.len - 2], 0..) |_, j| {
            const sum: f32 = @floatFromInt(matrix[i][j] +
                matrix[i][j + 1] +
                matrix[i][j + 2] +
                matrix[i + 1][j + 1] +
                matrix[i + 2][j] +
                matrix[i + 2][j + 1] +
                matrix[i + 2][j + 2]);
            max = @max(max, sum);
        }
    }
    return @intFromFloat(max);
}

test "maximum hourglass value of 13" {
    var matrix = [_][]const i32{
        &[_]i32{ 1, 1, 1, 0, 0, 0 },
        &[_]i32{ 0, 1, 0, 0, 0, 0 },
        &[_]i32{ 1, 1, 1, 0, 0, 0 },
        &[_]i32{ 0, 9, 2, -4, -4, 0 },
        &[_]i32{ 0, 0, 0, -2, 0, 0 },
        &[_]i32{ 0, 0, -1, -2, -4, 0 },
    };
    const expected: i32 = 13;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of -6" {
    var matrix = [_][]const i32{
        &[_]i32{ -1, -1, 0, -9, -2, -2 },
        &[_]i32{ -2, -1, -6, -8, -2, -5 },
        &[_]i32{ -1, -1, -1, -2, -3, -4 },
        &[_]i32{ -1, -9, -2, -4, -4, -5 },
        &[_]i32{ -7, -3, -3, -2, -9, -9 },
        &[_]i32{ -1, -3, -1, -2, -4, -5 },
    };
    const expected: i32 = -6;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 44" {
    var matrix = [_][]const i32{
        &[_]i32{ 7, 6, 8, 2, 4, 3 },
        &[_]i32{ 7, 3, 3, 0, 6, 1 },
        &[_]i32{ 3, 8, 7, 7, 2, 2 },
        &[_]i32{ 0, 8, 6, 8, 6, 1 },
        &[_]i32{ 7, 1, 6, 0, 2, 4 },
        &[_]i32{ 2, 7, 8, 1, 7, 4 },
    };
    const expected: i32 = 44;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 33" {
    var matrix = [_][]const i32{
        &[_]i32{ 3, 7, -3, 0, 1, 8 },
        &[_]i32{ 1, -4, -7, -8, -6, 5 },
        &[_]i32{ -8, 1, 3, 3, 5, 7 },
        &[_]i32{ -2, 4, 3, 1, 2, 7 },
        &[_]i32{ 2, 4, -5, 1, 8, 4 },
        &[_]i32{ 5, -7, 6, 5, 2, 8 },
    };
    const expected: i32 = 33;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 25" {
    var matrix = [_][]const i32{
        &[_]i32{ 0, 6, -7, 1, 6, 3 },
        &[_]i32{ -8, 2, 8, 3, -2, 7 },
        &[_]i32{ -3, 3, -6, -3, 0, -6 },
        &[_]i32{ 5, 0, 5, -1, -5, 2 },
        &[_]i32{ 6, 2, 8, 1, 3, 0 },
        &[_]i32{ 8, 5, 0, 4, -7, 4 },
    };
    const expected: i32 = 25;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of -19" {
    var matrix = [_][]const i32{
        &[_]i32{ 0, -4, -6, 0, -7, -6 },
        &[_]i32{ -1, -2, -6, -8, -3, -1 },
        &[_]i32{ -8, -4, -2, -8, -8, -6 },
        &[_]i32{ -3, -1, -2, -5, -7, -4 },
        &[_]i32{ -3, -5, -3, -6, -6, -6 },
        &[_]i32{ -3, -6, 0, -8, -6, -7 },
    };
    const expected: i32 = -19;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 19" {
    var matrix = [_][]const i32{
        &[_]i32{ 1, 1, 1, 0, 0, 0 },
        &[_]i32{ 0, 1, 0, 0, 0, 0 },
        &[_]i32{ 1, 1, 1, 0, 0, 0 },
        &[_]i32{ 0, 0, 2, 4, 4, 0 },
        &[_]i32{ 0, 0, 0, 2, 0, 0 },
        &[_]i32{ 0, 0, 1, 2, 4, 0 },
    };
    const expected: i32 = 19;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}
test "maximum hourglass value of 63 (all 9)" {
    var matrix = [_][]const i32{
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
        &[_]i32{ 9, 9, 9, 9, 9, 9 },
    };
    const expected: i32 = 63;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of -63 (all -9)" {
    var matrix = [_][]const i32{
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
        &[_]i32{ -9, -9, -9, -9, -9, -9 },
    };
    const expected: i32 = -63;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 0 (all zeros)" {
    var matrix = [_][]const i32{
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
        &[_]i32{ 0, 0, 0, 0, 0, 0 },
    };
    const expected: i32 = 0;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 0" {
    var matrix = [_][]const i32{
        &[_]i32{
            -1,
            1,
            -1,
            0,
            0,
            0,
        },
        &[_]i32{
            0,
            -1,
            0,
            0,
            0,
            0,
        },
        &[_]i32{
            -1,
            -1,
            -1,
            0,
            0,
            0,
        },
        &[_]i32{
            0,
            -9,
            2,
            -4,
            -4,
            0,
        },
        &[_]i32{
            -7,
            0,
            0,
            -2,
            0,
            0,
        },
        &[_]i32{ 0, 0, -1, -2, -4, 0 },
    };
    const expected: i32 = 0;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 35" {
    var matrix = [_][]const i32{
        &[_]i32{ 1, 2, 3 },
        &[_]i32{ 4, 5, 6 },
        &[_]i32{ 7, 8, 9 },
    };
    const expected: i32 = 35;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}

test "maximum hourglass value of 30" {
    var matrix = [_][]const i32{
        &[_]i32{ 6, 2, 1, 3 },
        &[_]i32{ 4, 2, 1, 5 },
        &[_]i32{ 9, 2, 8, 7 },
        &[_]i32{ 4, 1, 2, 9 },
    };
    const expected = 30;
    const actual = hourGlassSum(@TypeOf(matrix[0][0]), &matrix);
    try expectEqual(expected, actual);
}
