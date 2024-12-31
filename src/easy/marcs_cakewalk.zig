const std = @import("std");
const expectEqual = std.testing.expectEqual;
const alloc = std.testing.allocator.alloc;

pub fn marcsCakewalk(calorie: []u64) u64 {
    var miles: u64 = 0;
    std.mem.sort(u64, calorie[0..], {}, comptime std.sort.desc(u64));
    for (calorie, 0..) |cupcake, index| {
        miles += std.math.pow(u64, 2, index) * cupcake;
    }
    return miles;
}

test "Test 5,7,10" {
    var calories = [_]u64{ 5, 10, 7 };
    const output = 44;
    try expectEqual(marcsCakewalk(calories[0..]), output);
}
test "Test with value length 5" {
    var input = [_]u64{ 1, 3, 2 };
    const output = 11;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
test "Test with value length 78" {
    var input = [_]u64{ 504, 378, 291, 380, 728, 630, 797, 212, 32, 792, 895, 635, 850, 853, 859, 127, 653, 655, 476, 748 };
    const output = 124138217;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
test "Test with value length 154" {
    var input = [_]u64{ 819, 701, 578, 403, 50, 400, 983, 665, 510, 523, 696, 532, 51, 449, 333, 234, 958, 460, 277, 347, 950, 53, 123, 227, 646, 190, 938, 61, 409, 110, 61, 178, 659, 989, 625, 237, 944, 550, 954, 439 };
    const output = 59715404338867;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
test "Test with value length 157" {
    var input = [_]u64{ 801, 234, 536, 747, 172, 590, 833, 847, 509, 429, 666, 411, 609, 894, 348, 254, 814, 767, 647, 965, 711, 801, 852, 781, 972, 390, 218, 290, 508, 174, 55, 714, 442, 284, 745, 872, 46, 131, 833, 315 };
    const output = 84350424920174;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
test "Test with value length 76" {
    var input = [_]u64{ 353, 726, 36, 574, 234, 746, 507, 244, 382, 349, 107, 279, 608, 87, 459, 793, 710, 73, 758, 945 };
    const output = 73444139;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
test "Test with value length 7" {
    var input = [_]u64{ 7, 4, 9, 6 };
    const output = 79;
    try expectEqual(marcsCakewalk(input[0..]), output);
}
