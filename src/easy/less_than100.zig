const expectEqual = @import("std").testing.expectEqual;

pub fn lessThan100(a: i32, b: i32) bool {
    return a + b < 100;
}
test "the sum of two numbers is less than 100" {
    try expectEqual(lessThan100(5, 57), true);
    try expectEqual(lessThan100(77, 30), false);
    try expectEqual(lessThan100(0, 59), true);
    try expectEqual(lessThan100(78, 35), false);
    try expectEqual(lessThan100(63, 11), true);
    try expectEqual(lessThan100(37, 99), false);
    try expectEqual(lessThan100(52, 11), true);
    try expectEqual(lessThan100(82, 95), false);
    try expectEqual(lessThan100(17, 44), true);
    try expectEqual(lessThan100(74, 53), false);
    try expectEqual(lessThan100(3, 77), true);
    try expectEqual(lessThan100(25, 80), false);
    try expectEqual(lessThan100(59, 28), true);
    try expectEqual(lessThan100(69, 87), false);
    try expectEqual(lessThan100(10, 45), true);
    try expectEqual(lessThan100(43, 58), false);
    try expectEqual(lessThan100(50, 44), true);
    try expectEqual(lessThan100(74, 89), false);
    try expectEqual(lessThan100(3, 27), true);
    try expectEqual(lessThan100(21, 79), false);
}
