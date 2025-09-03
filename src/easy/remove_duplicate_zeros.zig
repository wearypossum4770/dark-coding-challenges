const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;

const debug = std.debug.print;

pub fn removeDuplicateZeros(comptime T: type, arr: []T) void {
    const right: usize = arr.len - 1;
    var left: usize = 0;

    while (left <= right) : (left += 1) {
        var r = right;
        if (arr[left] == 0) {
            while (r > left) : (r -= 1) {
                arr[r] = arr[r - 1];
            }
            left += 1;
        }
    }
}
