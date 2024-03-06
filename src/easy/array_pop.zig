const expect = @import("std").testing.expect;

pub fn array_pop(array: []i32) i32 {
	return array[0];
}
test "integer subtraction" {
try expect(array_pop([_]i32 [1, 2, 3]) == 1);
try expect(array_pop([_]i32 [80, 5, 100]) == 80);
try expect(array_pop([_]i32 [-500, 0, 50]) == -500);
try expect(array_pop([_]i32 [5, 2, 3]) == 5);
try expect(array_pop([_]i32 [75675, 5, 100]) == 75675);
try expect(array_pop([_]i32 [-52320, 0, 50]) == -52320);

}