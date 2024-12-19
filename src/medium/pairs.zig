/// [Hacker Rank](https://www.hackerrank.com/challenges/pairs/problem)
const std = @import("std");
const expectEqual = std.testing.expectEqual;

pub fn pairs(k: i32, arr: []const i32) i32 {
    var count: i32 = 0;
    for (arr) |outer| {
        for (arr) |inner| {
            if (outer == inner) break;
            if (@abs(outer - inner) == k) {
                count += 1;
            }
        }
    }
    return count;
}

test "The amount of pairs in a set within a distance example 1" {
    const nums = [_]i32{ 1, 5, 3, 4, 2 };
    try expectEqual(pairs(2, nums[0..]), 3);
}
test "The amount of pairs in a set within a distance example 2" {
    const nums = [_]i32{
        363374326,
        364147530,
        61825163,
        1073065718,
        1281246024,
        1399469912,
        428047635,
        491595254,
        879792181,
        1069262793,
    };
    try expectEqual(pairs(1, nums[0..]), 0);
}
test "The amount of pairs in a set within a distance example 3" {
    const nums = [_]i32{ 1, 3, 5, 8, 6, 4, 2 };
    try expectEqual(pairs(2, nums[0..]), 5);
}
