const expectApproxEqRel = @import("std").testing.expectApproxEqRel;

pub fn yearsInOneHouse(age: f32, moves: f32) f32 {
    if (moves < 0) return 0;
    return age / (moves + 1);
}
const TOLERANCE: f32 = 0.1;

test "The averge time someone moved at age 30 with 1 moves" {
    try expectApproxEqRel(yearsInOneHouse(30, 1), 15, TOLERANCE);
}
test "The averge time someone moved at age 15 with 2 moves" {
    try expectApproxEqRel(yearsInOneHouse(15, 2), 5, TOLERANCE);
}
test "The averge time someone moved at age 80 with 0 moves" {
    try expectApproxEqRel(yearsInOneHouse(80, 0), 80, TOLERANCE);
}
test "The averge time someone moved at age 23 with 2 moves" {
    try expectApproxEqRel(yearsInOneHouse(23, 2), 8, TOLERANCE);
}
test "The averge time someone moved at age 31 with 2 moves" {
    try expectApproxEqRel(yearsInOneHouse(31, 2), 10, TOLERANCE);
}
test "The averge time someone moved at age 1 with 0 moves" {
    try expectApproxEqRel(yearsInOneHouse(1, 0), 1, TOLERANCE);
}
