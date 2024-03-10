const expect = @import("std").testing.expect;
const expectEqual = @import("std").testing.expectEqual;
pub fn divisibleByThree(a: i32) bool {
    return remainder(a, 3) == 0;
}
pub fn divisibleBy100(a: i32) bool {
    return remainder(a, 100) == 0;
}
pub fn divisibleByFive(a: i32) bool {
    return remainder(a, 5) == 0;
}
pub fn divisibleBySeven(a: i32) bool {
    return remainder(a, 7) == 0;
}
pub fn remainder(a: i32, b: i32) i32 {
    if (b == 0) {
        return 0;
    }
    return @rem(a, b);
}
test divisibleByThree {
    try expect(divisibleByThree(3));
}
test divisibleBy100 {
    try expectEqual(divisibleBy100(1), false);
    try expectEqual(divisibleBy100(100), true);
    try expectEqual(divisibleBy100(1000), true);
    try expectEqual(divisibleBy100(111000), true);
    try expectEqual(divisibleBy100(-1), false); //, "Don't forget negatives.");
    try expectEqual(divisibleBy100(0), true); //, "Cover the 0 cases.");
    try expectEqual(divisibleBy100(-100), true); //, "-100 is divisible by 100.");
}
test divisibleByFive {
    try expectEqual(divisibleByFive(7), false);
    try expectEqual(divisibleByFive(5), true);
    try expectEqual(divisibleByFive(15), true);
    try expectEqual(divisibleByFive(33), false);
    try expectEqual(divisibleByFive(-18), false);
    try expectEqual(divisibleByFive(999), false);
    try expectEqual(divisibleByFive(2), false);
}
test divisibleBySeven {
    try expect(divisibleBySeven(7));
}
test remainder {
    try expectEqual(remainder(7, 2), 1);
    try expectEqual(remainder(3, 4), 3);
    try expectEqual(remainder(-9, 45), -9);
    try expectEqual(remainder(5, 5), 0);
    try expectEqual(remainder(1, 3), 1);
}
