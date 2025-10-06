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
