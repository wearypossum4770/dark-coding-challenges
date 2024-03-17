const expectApproxEqRel = @import("std").testing.expectApproxEqRel;

pub fn yearsInOneHouse(age: f32, moves: f32) f32 {
    if (moves == -1) return 0;
    return age / (moves + 1);
}
test "The average time someone moved." {
    const tolerance: f32 = 0.1;
    try expectApproxEqRel(yearsInOneHouse(30, 1), 15, tolerance);
    try expectApproxEqRel(yearsInOneHouse(15, 2), 5, tolerance);
    try expectApproxEqRel(yearsInOneHouse(80, 0), 80, tolerance);
    try expectApproxEqRel(yearsInOneHouse(23, 2), 8, tolerance);
    try expectApproxEqRel(yearsInOneHouse(31, 2), 10, tolerance);
    try expectApproxEqRel(yearsInOneHouse(1, 0), 1, tolerance);
}
