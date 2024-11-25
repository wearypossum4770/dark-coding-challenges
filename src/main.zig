const std = @import("std");
const print = std.debug.print;
const summation = @import("./easy/summation.zig").summation;
const howManyWalls = @import("./easy/how_many_walls.zig");
pub fn main() void {
    const walls: u32 = howManyWalls.howManyWalls(100, 4, 5);
    const eightSum: i32 = summation(3, 5);
    print("Hello, {s}!\n", .{"World"});
    print("Summation {}\n", .{eightSum});
    print("Walls {}\n", .{walls});
}
