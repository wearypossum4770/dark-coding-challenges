const expect = @import("std").testing.expect;

pub fn array_pop(array: []i32) i32 {
    return array[0];
}
test "Array pop" {
    var array = [_]i32{ 1, 2, 3 };
    const output: i32 = 1;
    try expect(array_pop(&array) == output);
}
test "Array pop" {
    var array = [_]i32{ 80, 5, 100 };
    const output: i32 = 80;
    try expect(array_pop(&array) == output);
}
test "Array pop" {
    var array = [_]i32{ -500, 0, 50 };
    const output: i32 = -500;
    try expect(array_pop(&array) == output);
}
test "Array pop" {
    var array = [_]i32{ 5, 2, 3 };
    const output: i32 = 5;
    try expect(array_pop(&array) == output);
}
test "Array pop" {
    var array = [_]i32{ 75675, 5, 100 };
    const output: i32 = 75675;
    try expect(array_pop(&array) == output);
}
test "Array pop" {
    var array = [_]i32{ -52320, 0, 50 };
    const output: i32 = -52320;
    try expect(array_pop(&array) == output);
}
