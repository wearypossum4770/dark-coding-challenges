const expect = @import("std").testing.expect;

pub fn summation(x: i32, y: i32) i32 {
    return x + y;
}
fn addFive(x: u32) u32 {
    return x + 5;
}


test "summation function" {
    const y = summation(2, 9);
    const a = summation(1, 3);
    const b = summation(3, 4);
    try expect(@TypeOf(a) == i32);
    try expect(@TypeOf(b) == i32);
    try expect(a == 4);
    try expect(b == 7);
    try expect(@TypeOf(y) == i32);
    try expect(y == 11);
}
test "function" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}
