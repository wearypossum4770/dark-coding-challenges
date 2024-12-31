const expectEqual = @import("std").testing.expectEqual;

pub fn inchesToFeet(inches: i32) i32 {
    if (inches < 12) {
        return 0;
    }
    return @divFloor(inches, 12);
}
test "Convert 12 inches to feet (floor)" {
    try expectEqual(inchesToFeet(12), 1);
}
test "Convert 360 inches to feet (floor)" {
    try expectEqual(inchesToFeet(360), 30);
}
test "Convert 3612 inches to feet (floor)" {
    try expectEqual(inchesToFeet(3612), 301);
}
test "Convert 324 inches to feet (floor)" {
    try expectEqual(inchesToFeet(324), 27);
}
test "Convert 3012 inches to feet (floor)" {
    try expectEqual(inchesToFeet(3012), 251);
}
test "Convert 11 inches to feet (floor)" {
    try expectEqual(inchesToFeet(11), 0);
}
