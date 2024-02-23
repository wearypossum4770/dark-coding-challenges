const std = @import("std");
const inf = std.math.inf(f64);
const expect = @import("std").testing.expect;

pub fn division(a: f64, b: f64) f64 {
    if (b == 0) {
        return inf;
    }
    return a / b;
}

test "Division by Zero" {
    const a: f64 = 5.0;
    const b: f64 = 0.0;
    const quotient = division(a, b);
    try expect(quotient == inf);
}

test "Division by non-zero number" {
    const a: f64 = 12;
    const b: f64 = 3;
    const quotient = division(a,b);
    try expect(quotient == 4.0);
}
