const std = @import("std");
const expectEqual = std.testing.expectEqual;
const summation = @import("./summation.zig");
const sumReduce = summation.sumReduce;
pub fn balancedSums(arr: []const i32) []const u8 {
    var left: i32 = 0;
    var right = sumReduce(i32, arr);
    for (arr) |value| {
        right -= value;
        if (left == right) return "YES";
        left += value;
    }
    return "NO";
}

test "A balance subarray exists in [5,6,8,11]" {
    const param = [_]i32{ 5, 6, 8, 11 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "A balance subarray exists in [1,2,3]" {
    const param = [_]i32{ 1, 2, 3 };
    try expectEqual(balancedSums(param[0..]), "NO");
}
test "A balance subarray exists in [1,2,3,3]" {
    const param = [_]i32{ 1, 2, 3, 3 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "A balance subarray exists in [1,1,4,1,1]" {
    const param = [_]i32{ 1, 1, 4, 1, 1 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "A balance subarray exists in [2,0,0,0]" {
    const param = [_]i32{ 2, 0, 0, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "A balance subarray exists in [0,0,2,0," {
    const param = [_]i32{
        0,
        0,
        2,
        0,
    };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {1, 2, 3};" {
    const param = [_]i32{ 1, 2, 3 };
    try expectEqual(balancedSums(param[0..]), "NO");
}
test "Find a valid subarray in {1, 2, 3, 3};" {
    const param = [_]i32{ 1, 2, 3, 3 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {1, 1, 4, 1, 1};" {
    const param = [_]i32{ 1, 1, 4, 1, 1 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {2, 0, 0, 0};" {
    const param = [_]i32{ 2, 0, 0, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {0, 0, 2, 0};" {
    const param = [_]i32{ 0, 0, 2, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
//  Basic test cases

test "Find a valid subarray in {1};" {
    const param = [_]i32{1};
    try expectEqual(balancedSums(param[0..]), "YES");
}
//  Edge cases
test "Find a valid subarray in {};" {
    const param = [_]i32{};
    try expectEqual(balancedSums(param[0..]), "NO");
}
test "Find a valid subarray in {0};" {
    const param = [_]i32{0};
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {1, 1, 1, 1, 1};" {
    const param = [_]i32{ 1, 1, 1, 1, 1 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {5, 5, 5};" {
    const param = [_]i32{ 5, 5, 5 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {5, 5, 5, 5};" {
    const param = [_]i32{ 5, 5, 5, 5 };
    try expectEqual(balancedSums(param[0..]), "NO");
}

test "Find a valid subarray in {0, 0, 0, 2};" {
    const param = [_]i32{ 0, 0, 0, 2 };
    try expectEqual(balancedSums(param[0..]), "YES");
}

//  Negative numbers
test "Find a valid subarray in {-1, -2, -3, -4, -1};" {
    const param = [_]i32{ -1, -2, -3, -4, -1 };
    try expectEqual(balancedSums(param[0..]), "NO");
}
test "Find a valid subarray in {-2, -3, 10, -3, -2};" {
    const param = [_]i32{ -2, -3, 10, -3, -2 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {1, -1, 0};" {
    const param = [_]i32{ 1, -1, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {-1, -1, 2};" {
    const param = [_]i32{ -1, -1, 2 };
    try expectEqual(balancedSums(param[0..]), "NO");
}
//  Large numbers
test "Find a valid subarray in {1e6, 0, 1e6};" {
    const param = [_]i32{ 1e6, 0, 1e6 };
    try expectEqual(balancedSums(param[0..]), "YES");
}

//  Longer sequences
test "Find a valid subarray in {5, 6, 8, 11};" {
    const nines = [_]i32{ 999999, 999999, 999999, 999999 };
    try expectEqual(balancedSums(nines[0..]), "NO");
    const param = [_]i32{ 5, 6, 8, 11 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {1, 2, 3, 4, 6};" {
    const param = [_]i32{ 1, 2, 3, 4, 6 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
//  Zero-sum cases
test "Find a valid subarray in {0, 0, 0, 0};" {
    const param = [_]i32{ 0, 0, 0, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {0, 0, 1, 0};" {
    const param = [_]i32{ 0, 0, 1, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
//  Complex cases
test "Find a valid subarray in {2, 0, 0, 0, 2};" {
    const param = [_]i32{ 2, 0, 0, 0, 2 };
    try expectEqual(balancedSums(param[0..]), "YES");
}

test "Find a valid subarray in {20, 10, 30, 10, 20};" {
    const param = [_]i32{ 20, 10, 30, 10, 20 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {10, 10, 10, 30, 10, 10, 10};" {
    const param = [_]i32{ 10, 10, 10, 30, 10, 10, 10 };
    try expectEqual(balancedSums(param[0..]), "YES");
}

test "Find a valid subarray in {10, 20, 30, 40};" {
    const param = [_]i32{ 10, 20, 30, 40 };
    try expectEqual(balancedSums(param[0..]), "NO");
}
test "Find a valid subarray in {1, 1, 1, 3, 1, 1, 1};" {
    const param = [_]i32{ 1, 1, 1, 3, 1, 1, 1 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
test "Find a valid subarray in {10, 0, 0};" {
    const param = [_]i32{ 10, 0, 0 };
    try expectEqual(balancedSums(param[0..]), "YES");
}
