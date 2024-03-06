const expect = @import("std").testing.expect;

pub fn nextInteger(number: i32) i32 {
    return number + 1;
}

test "2 plus 1 equals 3." {
    try expect(nextInteger(2) == 3);
}
test "-8 plus 1 equals -9." {
    try expect(nextInteger(-9) == -8);
}
test "0 plus 1 equals 1." {
    try expect(nextInteger(0) == 1);
}
test "999 plus 1 equals 1000." {
    try expect(nextInteger(999) == 1000);
}
test "73 plus 1 equals 74." {
    try expect(nextInteger(73) == 74);
}
