const expect = @import("std").testing.expect;

pub fn circuitPower(voltage: i32, current: i32) i32 {
	return voltage * current;
}
test "integer subtraction" {
try expect(circuitPower(110, 3) == 330);
try expect(circuitPower(230, 10) == 2300);
try expect(circuitPower(480, 20) == 9600);
}