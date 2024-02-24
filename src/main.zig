const std = @import("std");
const print = std.debug.print;
const summation = @import("./easy/summation.zig").summation;

pub fn main() void {
    const eightSum: i32 = summation(3, 5);
    print("Hello, {s}!\n", .{"World"});
    print("Summation {}\n", .{eightSum});
}
