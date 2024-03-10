const std = @import("std");
const ENABLE_MATH_FUNCTIONS: bool = false;

pub fn main() void {
    std.debug.print("input={}\n", .{ENABLE_MATH_FUNCTIONS});
}
