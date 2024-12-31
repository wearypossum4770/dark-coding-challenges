const expectEqual = @import("std").testing.expectEqual;

pub fn separateNumbers(minuend: i32, subtrahend: i32) i32 {
    return minuend - subtrahend;
}
test "" {
    const a: i32 = 3;
    const b: i32 = 2;
    const c: i32 = 945;
    const d: i32 = 422;
    const difference = separateNumbers(a, b);
    const e = separateNumbers(c, d);
    try expectEqual(difference, 1);
    try expectEqual(e, 523);
}
