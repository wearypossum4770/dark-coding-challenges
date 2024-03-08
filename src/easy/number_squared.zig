const pow = @import("std").math.pow;
const expectEqual = @import("std").testing.expectEqual;

pub fn numberSquared(num: i32) i32 {
    return pow(i32, num, 2);
}
test "Square a number" {
    try expectEqual(
        numberSquared(10),
        100,
    );
    try expectEqual(
        numberSquared(69),
        4761,
    );
    try expectEqual(
        numberSquared(666),
        443556,
    );
    try expectEqual(
        numberSquared(-21),
        441,
    );
    try expectEqual(
        numberSquared(21),
        441,
    );
}
