const std = @import("std");
const expectEqual = std.testing.expectEqual;
// using a tuple c(anonymous struct)
pub fn compareTriplets(alice: [3]u8, bob: [3]u8) ![2]u8 {
    var score: [2]u8 = .{
        @as(u8, 0),
        @as(u8, 0),
    };
    var idx: usize = 0;
    inline for (alice) |item| {
        if (item > bob[idx]) {
            score[0] += 1;
        }
        if (item < bob[idx]) {
            score[1] += 1;
        }
        idx += 1;
    }
    return score;
}
test "Compare alice and bob winnings" {
    // expectEqualSlices may be a good comparing function.
    try expectEqual(compareTriplets([3]u8{ 5, 6, 7 }, [3]u8{ 3, 6, 10 }), [2]u8{ 1, 1 });
    try expectEqual(compareTriplets([3]u8{ 1, 2, 3 }, [3]u8{ 1, 2, 3 }), [2]u8{ 0, 0 });
    try expectEqual(compareTriplets([3]u8{ 6, 8, 12 }, [3]u8{ 7, 9, 15 }), [2]u8{ 0, 3 });
    try expectEqual(compareTriplets([3]u8{ 10, 15, 20 }, [3]u8{ 5, 6, 7 }), [2]u8{ 3, 0 });
    try expectEqual(compareTriplets([3]u8{ 10, 12, 50 }, [3]u8{ 20, 20, 10 }), [2]u8{ 1, 2 });
    try expectEqual(compareTriplets([3]u8{ 10, 20, 30 }, [3]u8{ 5, 5, 50 }), [2]u8{ 2, 1 });
    try expectEqual(compareTriplets([3]u8{ 20, 20, 30 }, [3]u8{ 20, 20, 50 }), [2]u8{ 0, 1 });
    try expectEqual(compareTriplets([3]u8{ 17, 28, 30 }, [3]u8{ 99, 16, 8 }), [2]u8{ 2, 1 });
}
