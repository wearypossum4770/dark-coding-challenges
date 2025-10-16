const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

fn hello() []const u8 {
    return "Hello World";
}
pub fn createHelloWorld() *const fn () []const u8 {
    return hello;
}
