const expectEqual = @import("std").testing.expectEqual;

pub fn inchesToFeet(inches: i32) i32 {
    if (inches < 12) {
        return 0;
    }
    return @divFloor(inches, 12);
}
test "convert inches to fee" {
    try expectEqual(inchesToFeet(12), 1);
    try expectEqual(inchesToFeet(360), 30);
    try expectEqual(inchesToFeet(3612), 301);
    try expectEqual(inchesToFeet(324), 27);
    try expectEqual(inchesToFeet(3012), 251);
    try expectEqual(inchesToFeet(11), 0);
}
