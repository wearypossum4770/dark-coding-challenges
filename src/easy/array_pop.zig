const expectEqual = @import("std").testing.expectEqual;

pub fn array_pop(array: []i32) i32 {
    return array[0];
}
test "Array pop  1" {
    var array = [_]i32{ 1, 2, 3 };
    const output: i32 = 1;
    try expectEqual(array_pop(&array), output);
}
test "Array pop  80" {
    var array = [_]i32{ 80, 5, 100 };
    const output: i32 = 80;
    try expectEqual(array_pop(&array), output);
}
test "Array pop -500" {
    var array = [_]i32{ -500, 0, 50 };
    const output: i32 = -500;
    try expectEqual(array_pop(&array), output);
}
test "Array pop  5" {
    var array = [_]i32{ 5, 2, 3 };
    const output: i32 = 5;
    try expectEqual(array_pop(&array), output);
}
test "Array pop  75675" {
    var array = [_]i32{ 75675, 5, 100 };
    const output: i32 = 75675;
    try expectEqual(array_pop(&array), output);
}
test "Array pop -52320" {
    var array = [_]i32{ -52320, 0, 50 };
    const output: i32 = -52320;
    try expectEqual(array_pop(&array), output);
}
