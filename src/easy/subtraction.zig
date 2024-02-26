const expect = @import("std").testing.expect;

pub fn integerSubtraction(minuend: i32, subtrahend: i32) i32 {
    return minuend - subtrahend;
}

test "integer subtraction" {
    const a: i32 = 3;
    const b: i32 = 2;
    const c: i32 = 945;
    const d: i32 = 422;
    const difference = integerSubtraction(a, b);
    const e = integerSubtraction(c, d);
    try expect(difference == 1);
    try expect(e == 523);
}
