const std = @import("std");
const expectEqual = std.testing.expectEqual;
const expectApproxEqAbs = std.testing.expectApproxEqAbs;
const PI = std.math.pi;
pub fn radiansToDegrees(radians: f32) f32 {
    return radians * (180.0 / PI);
}
test "Convert radians to degrees" {
    const tolerance = 0.0001;
    try expectApproxEqAbs(radiansToDegrees(1), 57.29577951308232, tolerance);
    try expectApproxEqAbs(radiansToDegrees(5), 286.4788975654116, tolerance);
    try expectApproxEqAbs(radiansToDegrees(7), 401.07045659157626, tolerance);
    try expectApproxEqAbs(radiansToDegrees(100), 5729.5779513082325, tolerance);
    try expectApproxEqAbs(radiansToDegrees(180), 10313.240312354817, tolerance);
}
