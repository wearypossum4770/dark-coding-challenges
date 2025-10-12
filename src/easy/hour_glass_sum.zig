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
