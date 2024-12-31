const std = @import("std");
const memoryEquals = std.mem.eql;
const expectApproxEqRel = std.testing.expectApproxEqRel;
const power = std.math.pow;
const pi = std.math.pi;
pub fn triangleArea(base: f32, height: f32) f32 {
    return parallelogramArea(base, height) * 0.5;
}
pub fn parallelogramArea(base: f32, height: f32) f32 {
    return base * height;
}
pub fn ellipseArea(a: f32, b: f32) f32 {
    return pi * a * b;
}
pub fn trapezoidArea(a: f32, b: f32, height: f32) f32 {
    return 0.5 * (a + b) * height;
}
pub fn rectangleArea(width: f32, length: f32) f32 {
    return parallelogramArea(width, length);
}
pub fn circleCircumference(radius: f32) f32 {
    return pi * power(radius, 2);
}
pub fn sectorArea(radius: f32, angleDegrees: f32) f32 {
    return 0.5 * radius * angleDegrees;
}
pub fn squareArea(side: f32) f32 {
    return power(side, 2);
}
pub fn shapeArea(a: f32, b: f32, shape: []const u8) f32 {
    if (memoryEquals(u8, shape, "parallelogram")) return parallelogramArea(a, b);
    if (memoryEquals(u8, shape, "triangle")) return triangleArea(a, b);
    return 0;
}
const TOLERANCE = 0.1;
test "determine the appropriate area" {
    // https://edabit.com/challenge/Z5nLWN9XscsuRi2oT
    try expectApproxEqRel(shapeArea(2, 3, "triangle"), 3, TOLERANCE);
    try expectApproxEqRel(shapeArea(8, 6, "parallelogram"), 48, TOLERANCE);
    try expectApproxEqRel(shapeArea(0, 1, "triangle"), 0, TOLERANCE);
    try expectApproxEqRel(shapeArea(2.9, 1.3, "parallelogram"), 3.77, TOLERANCE);
    try expectApproxEqRel(shapeArea(0.01, 5, "triangle"), 0.025, TOLERANCE);
}
