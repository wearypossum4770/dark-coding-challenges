const std = @import("std");
const expectEqualStrings = std.testing.expectEqualStrings;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;
pub fn intToFizzBuzz(comptime T: type, allocator: Allocator, n: T) ?[]const u8 {
    if (@mod(n, 15) == 0) return std.fmt.allocPrint(allocator, "FizzBuzz", .{}) catch return null;
    if (@mod(n, 5) == 0) return std.fmt.allocPrint(allocator, "Buzz", .{}) catch return null;
    if (@mod(n, 3) == 0) return std.fmt.allocPrint(allocator, "Fizz", .{}) catch return null;
    return std.fmt.allocPrint(allocator, "{d}", .{n}) catch return null;
}
pub fn fizzBuzz(comptime T: type, allocator: Allocator, n: T) ?[][]const u8 {
    if (n == 0) return null;
    var result = allocator.alloc([]const u8, n) catch return null;
    for (0..n) |i| {
        const str = intToFizzBuzz(T, allocator, i + 1) orelse {
            for (0..i) |j| {
                allocator.free(result[j]);
            }
            allocator.free(result);
            return null;
        };
        result[i] = str;
    }
    return result;
}
