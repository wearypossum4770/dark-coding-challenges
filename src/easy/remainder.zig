const expect = @import("std").testing.expect;
const expectEqual = @import("std").testing.expectEqual;
pub fn divisibleByThree(a: i32) bool {
    return remainder(a, 3) == 0;
}
pub fn divisibleByFive(a: i32) bool {
    return remainder(a, 5) == 0;
}
pub fn divisibleBySeven(a: i32) bool {
    return remainder(a, 7) == 0;
}
pub fn remainder(a: i32, b: i32) i32 {
    return @rem(a, b);
}
test divisibleByThree {
    try expect(divisibleByThree(3));
}
test divisibleByFive {
    try expect(divisibleByFive(5));
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
