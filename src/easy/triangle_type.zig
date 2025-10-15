const std = @import("std");
const expectEqualStrings = std.testing.expectEqualStrings;
const expectEqual = std.testing.expectEqual;

const TriangleName = enum { isosceles, equilateral, scalene, none };
pub fn isEquilateral(comptime T: type, a: T, b: T, c: T) bool {
    return a == b and b == c and a == c;
}
pub fn isIsosceles(comptime T: type, a: T, b: T, c: T) bool {
    return a == b or b == c or a == c;
}
pub fn isScalene(comptime T: type, a: T, b: T, c: T) bool {
    return !isEquilateral(T, a, b, c);
}

pub fn isTriangle(comptime T: type, a: T, b: T, c: T) bool {
    return a + b > c and b + c > a and a + c > b;
}
pub fn triangleTypeEnum(comptime T: type, nums: []const T) TriangleName {
    const a = nums[0];
    const b = nums[1];
    const c = nums[2];
    if (!isTriangle(T, a, b, c)) return TriangleName.none;
    if (isEquilateral(T, a, b, c)) return TriangleName.equilateral;
    if (isIsosceles(T, a, b, c)) return TriangleName.isosceles;
    return TriangleName.scalene;
}
pub fn triangleType(comptime T: type, nums: []const T) []const u8 {
    const a = nums[0];
    const b = nums[1];
    const c = nums[2];
    if (!isTriangle(T, a, b, c)) return "none";
    if (isEquilateral(T, a, b, c)) return "equilateral";
    if (isIsosceles(T, a, b, c)) return "isosceles";
    return "scalene";
}

test "triangle with sides 4, 5, 6" {
    const a: u32 = 4;
    const b: u32 = 5;
    const c: u32 = 6;
    const expected = true;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 3, 4, 6" {
    const a: u32 = 3;
    const b: u32 = 4;
    const c: u32 = 6;
    const expected = true;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 2, 5, 7" {
    const a: u32 = 2;
    const b: u32 = 5;
    const c: u32 = 7;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 2, 5, 9" {
    const a: u32 = 2;
    const b: u32 = 5;
    const c: u32 = 9;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 2, 9, 5" {
    const a: u32 = 2;
    const b: u32 = 9;
    const c: u32 = 5;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 9, 2, 5" {
    const a: u32 = 9;
    const b: u32 = 2;
    const c: u32 = 5;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 11, 12, 20" {
    const a: u32 = 11;
    const b: u32 = 12;
    const c: u32 = 20;
    const expected = true;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 14, 3, 12" {
    const a: u32 = 14;
    const b: u32 = 3;
    const c: u32 = 12;
    const expected = true;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 23, 4, 28" {
    const a: u32 = 23;
    const b: u32 = 4;
    const c: u32 = 28;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}
test "triangle with sides 21, 4, 25" {
    const a: u32 = 21;
    const b: u32 = 4;
    const c: u32 = 25;
    const expected = false;
    const actual = isTriangle(@TypeOf(a), a, b, c);
    try expectEqual(expected, actual);
}

test "advanced triangle with sides [3, 3, 3]" {
    const nums = [_]i32{ 3, 3, 3 };
    const expected = "equilateral";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.equilateral, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}

test "advanced triangle with sides [3, 3, 2]" {
    const nums = [_]i32{ 3, 3, 2 };
    const expected = "isosceles";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.isosceles, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [5, 4, 5]" {
    const nums = [_]i32{ 5, 4, 5 };
    const expected = "isosceles";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.isosceles, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [7, 9, 9]" {
    const nums = [_]i32{ 7, 9, 9 };
    const expected = "isosceles";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.isosceles, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [3, 4, 5]" {
    const nums = [_]i32{ 3, 4, 5 };
    const expected = "scalene";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.scalene, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [4, 5, 6]" {
    const nums = [_]i32{ 4, 5, 6 };
    const expected = "scalene";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.scalene, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [10, 11, 12]" {
    const nums = [_]i32{ 10, 11, 12 };
    const expected = "scalene";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.scalene, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [8, 4, 4]" {
    const nums = [_]i32{ 8, 4, 4 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [1, 2, 3]" {
    const nums = [_]i32{ 1, 2, 3 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [2, 3, 5]" {
    const nums = [_]i32{ 2, 3, 5 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [10, 1, 1]" {
    const nums = [_]i32{ 10, 1, 1 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [0, 3, 3]" {
    const nums = [_]i32{ 0, 3, 3 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [-1, 3, 3]" {
    const nums = [_]i32{ -1, 3, 3 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [3, 0, 3]" {
    const nums = [_]i32{ 3, 0, 3 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [3, 3, -1]" {
    const nums = [_]i32{ 3, 3, -1 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
test "advanced triangle with sides [0, 0, 0]" {
    const nums = [_]i32{ 0, 0, 0 };
    const expected = "none";
    const actual = triangleType(@TypeOf(nums[0]), &nums);
    try expectEqualStrings(expected, actual);
    try expectEqual(TriangleName.none, triangleTypeEnum(@TypeOf(nums[0]), &nums));
}
