const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn mergeSortedArray(
    allocator: Allocator,
    num1: []const i32,
    m: usize,
    num2: []const i32,
    n: usize,
) ?[]const i32 {
    var result = allocator.alloc(i32, m + n) catch return null;
    var i: usize = 0;
    var j: usize = 0;
    var index: usize = 0;
    while (i < m and j < n) {
        if (num1[i] <= num2[j]) {
            result[index] = num1[i];
            i += 1;
        } else {
            result[index] = num2[j];
            j += 1;
        }
        index += 1;
    }
    while (i < m) {
        result[index] = num1[i];
        i += 1;
        index += 1;
    }
    while (j < n) {
        result[index] = num2[j];
        j += 1;
        index += 1;
    }

    return result;
}
