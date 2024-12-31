const pow = @import("std").math.pow;
const expectEqual = @import("std").testing.expectEqual;

pub fn numberSquared(num: i32) i32 {
    return pow(i32, num, 2);
}
test "Square the number 10" {
    const result = numberSquared(10);
    try expectEqual(
        result,
        100,
    );
}
test "Square the number 69" {
    const result = numberSquared(69);
    try expectEqual(
        result,
        4761,
    );
}
test "Square the number 666" {
    const result = numberSquared(666);
    try expectEqual(
        result,
        443556,
    );
}
test "Square the number -21" {
    const result = numberSquared(-21);
    try expectEqual(
        result,
        441,
    );
}
test "Square the number 21" {
    const result = numberSquared(21);
    try expectEqual(
        result,
        441,
    );
}
