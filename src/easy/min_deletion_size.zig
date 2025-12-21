const std = @import("std");

pub fn minDeletionSize(strs: []const []const u8) i32 {
    var count: i32 = 0;
    const rows = strs.len;
    const cols = strs[0].len;
    var col: usize = 0;
    while (col < cols) : (col += 1) {
        var row: usize = 1;
        while (row < rows) : (row += 1) {
            if (strs[row - 1][col] > strs[row][col]) {
                count += 1;
                break;
            }
        }
    }
    return count;
}
