const testing = @import("std").testing;

pub fn hello() []const u8 {
    return "Hello, World!";
}

test "Ziglang, Hello World" {
    const expected = "Hello, World!";
    const actual = hello_world.hello();
    try testing.expectEqualStrings(expected, actual);
}
