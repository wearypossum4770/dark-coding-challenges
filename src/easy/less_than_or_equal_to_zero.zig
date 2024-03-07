const expectEqual = @import("std").testing.expectEqual;

pub fn lessThanOrEqualToZero(number: i32) bool {
    return number <= 0;
}
test "integer subtraction" {
try expectEqual(lessThanOrEqualToZero(5), false);
try expectEqual(lessThanOrEqualToZero(0), true);
try expectEqual(lessThanOrEqualToZero(-5), true);

}
