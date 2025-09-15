const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn arrayReduce(comptime T: type, arr: []const T) T {
    if (arr.len == 0) return 0;
    var sum = arr[0];
    var index: usize = 1;
    while (index < arr.len) : (index += 1) {
        sum += arr[index];
    }
    return sum;
}
pub fn maximumWealth(comptime T: type, accounts: [][]const T) T {
    var max: T = std.math.minInt(T);
    if (accounts.len == 0) return 0;
    for (accounts) |account| {
        const total = arrayReduce(T, account);
        if (max < total) {
            max = total;
        }
    }
    if (max == std.math.minInt(T)) return 0;
    return max;
}

test "find the maximum account balance `j` among the customers `i` [[1,2,3], [3,2,1]]" {
    var accounts = [_][]const i32{ &[_]i32{ 1, 2, 3 }, &[_]i32{ 3, 2, 1 } };
    const expected: i32 = 6;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[1,5], [7,3], [3,5]]" {
    var accounts = [_][]const i32{ &[_]i32{ 1, 5 }, &[_]i32{ 7, 3 }, &[_]i32{ 3, 5 } };
    const expected: i32 = 10;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[2,8,7], [7,1,3], [1,9,5]]" {
    var accounts = [_][]const i32{ &[_]i32{ 2, 8, 7 }, &[_]i32{ 7, 1, 3 }, &[_]i32{ 1, 9, 5 } };
    const expected: i32 = 17;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[5,5,5]]" {
    var accounts = [_][]const i32{&[_]i32{ 5, 5, 5 }};
    const expected: i32 = 15;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[]]" {
    var accounts = [_][]const i32{&[_]i32{}};
    const expected: i32 = 0;
    const actual = maximumWealth(i32, &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[0,0,0], [0]]" {
    var accounts = [_][]const i32{ &[_]i32{ 0, 0, 0 }, &[_]i32{0} };
    const expected: i32 = 0;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[-1,-2], [-3]]" {
    var accounts = [_][]const i32{ &[_]i32{ -1, -2 }, &[_]i32{-3} };
    const expected: i32 = -3;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
test "find the maximum account balance `j` among the customers `i` [[1], [2,2], [0,10,0]]" {
    var accounts = [_][]const i32{ &[_]i32{1}, &[_]i32{ 2, 2 }, &[_]i32{ 0, 10, 0 } };
    const expected: i32 = 10;
    const actual = maximumWealth(@TypeOf(accounts[0][0]), &accounts);
    try expectEqual(expected, actual);
}
