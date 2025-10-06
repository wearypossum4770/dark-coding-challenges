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
