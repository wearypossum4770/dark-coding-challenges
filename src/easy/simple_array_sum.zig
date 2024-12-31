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
    try expectEqual(simpleArraySum(cards[0..]), 31);
}

test "Sum positive large integers" {
    var cards = [_]i32{ 338, 65, 713, 595, 428, 610, 728, 573, 871, 868 };
    try expectEqual(simpleArraySum(cards[0..]), 5789);
}
