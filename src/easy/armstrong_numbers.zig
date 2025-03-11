const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const textTools = @import("./text_tools.zig");

pub fn armstrongNumbers(param: i32) i32 {
    if (param < 0) return 0;
    var sum: i32 = 0;
    var num = param;
    const power: i32 = @intCast(textTools.numberString(i32, param).len);

    while (num > 0) : (num = @divTrunc(num, 10)) {
        const digit = @mod(num, 10);
        sum += std.math.pow(i32, digit, power);
    }
    if (sum == param) return 1;
    return 0;
}
