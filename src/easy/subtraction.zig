const expect = @import("std").testing.expect;

pub fn integer_subtraction(minuend: i32, subtrahend: i32) i32 {
    return minuend - subtrahend;
}

test "integer subtraction" {
    const a: i32 = 3;
    const b: i32 = 2;
    const c: i32 = 945;
    const d: i32 = 422;
    const difference = integer_subtraction(a, b);
    const e = integer_subtraction(c, d);
    try expect(difference == 1);
    try expect(e == 523);
}
