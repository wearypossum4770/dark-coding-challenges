const expect = @import("std").testing.expect;

pub fn ageToDays(age: u16) u16 {
    return age * 365;
}

test "Age on earth from days 3_650 to years 10" {
    try expect(ageToDays(10) == 3650);
}
test "Age on earth from days 0 to years 0" {
    try expect(ageToDays(0) == 0);
}
test "Age on earth from days 26+645 to years 73" {
    try expect(ageToDays(73) == 26645);
}
