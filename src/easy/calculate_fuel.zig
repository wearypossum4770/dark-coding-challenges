const expectEqual = @import("std").testing.expectEqual;

pub fn calculateFuel(distance: f32) f32 {
    const tank = distance * 10;
    if (tank > 100) {
        return tank;
    }
    return 100;
}
test "Calculate minimum fuel" {
    try expectEqual(calculateFuel(15), 150);
    try expectEqual(calculateFuel(23), 230);
    try expectEqual(calculateFuel(10), 100);
    try expectEqual(calculateFuel(3), 100);
    try expectEqual(calculateFuel(23.5), 235);
    try expectEqual(calculateFuel(3.14), 100);
    try expectEqual(calculateFuel(9.99999), 100);
    try expectEqual(calculateFuel(822315322), 8223153220);
    try expectEqual(calculateFuel(12345.6789), 123456.789);
    try expectEqual(calculateFuel(31.41), 314.1);
}
