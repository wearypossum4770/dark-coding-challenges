const std = @import("std");
const expect = std.testing.expect;
const textTools = @import("./text_tools.zig");

pub fn palindromeNumber(param: i32) bool {
    if (param < 0 or @mod(param, 10) == 0 and param != 0) return false;
    const number = textTools.numberString(i32, param);
    var right = number.len - 1;
    for (number) |num| {
        if (num != number[right]) {
            return false;
        }
        if (right == 0) {
            break;
        }
        right -= 1;
    }
    return true;
}
