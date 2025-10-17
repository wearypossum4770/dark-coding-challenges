const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

fn hello() []const u8 {
    return "Hello World";
}
pub fn createHelloWorld() *const fn () []const u8 {
    return hello;
}

test "createHelloWorld" {
    const helloWorld = createHelloWorld();
    const expected = "Hello World";
    try expectEqualStrings(expected, helloWorld());

    // Multiple calls
    try expectEqualStrings(expected, helloWorld());
    try expectEqualStrings(expected, helloWorld());
}
