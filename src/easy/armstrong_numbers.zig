const std = @import("std");
const expectEqual = std.testing.expectEqual;
const textTools = @import("./text_tools.zig");

pub fn armstrongNumbers(param: i32) usize {
    if (param < 0) return 0;
    var sum: usize = 0;
    var num = param;
    const power: i32 = @intCast(textTools.numberString(i32, param).len);

    while (num > 0) : (num = @divTrunc(num, 10)) {
        const digit = @mod(num, 10);
        const pow: usize = @intCast(std.math.pow(i32, digit, power));
        sum += pow;
    }
    if (sum == param) return 1;
    return 0;
}

test "feature armstrong number tests" {
    const test_cases = [_]struct { i32, u128 }{
        .{ 2, 1 },
        .{ 89, 0 },
        .{ 0, 1 },
        .{ 39, 0 },
        .{ 555, 0 },
        .{ 9475, 0 },
        .{ 9926315, 1 },
        .{ 93084, 1 },
        .{ 548834, 1 },
        .{ 2147483647, 0 },
        .{ 365, 0 },
        .{ 120, 0 },
        .{ 1253, 0 },
        .{ 153, 1 },
        .{ -153, 0 },
        .{ 407, 1 },
        .{ 370, 1 },
        .{ 371, 1 },
        .{ 1634, 1 },
        .{ 8208, 1 },
        .{ 9474, 1 },
    };
    for (test_cases) |step| {
        try expectEqual(step[1], armstrongNumbers(step[0]));
    }
}
