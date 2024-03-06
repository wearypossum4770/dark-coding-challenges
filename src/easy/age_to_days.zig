const expect = @import("std").testing.expect;

pub fn ageToDays(age: u16) u16 {
    return age * 365;
}
test "age to days" {
    try expect(ageToDays(10) == 3650);
    try expect(ageToDays(0) == 0);
    try expect(ageToDays(73) == 26645);
}
