const expectEqual = @import("std").testing.expectEqual;

pub fn simpleArraySum(sample: []i32) i32 {
    var target: i32 = 0;
    for (sample) |num| {
        target += num;
    }
    return target;
}
test "Sum small positive integers" {
    var cards = [_]i32{ 1, 2, 3, 4, 10, 11 };
    const hand: []i32 = cards[0..];
    try expectEqual(simpleArraySum(hand), 31);
}

test "Sum positive large integers" {
    var cards = [_]i32{ 338, 65, 713, 595, 428, 610, 728, 573, 871, 868 };
    const hand: []i32 = cards[0..];
    try expectEqual(simpleArraySum(hand), 5789);
}
