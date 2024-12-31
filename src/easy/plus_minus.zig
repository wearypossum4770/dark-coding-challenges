const expectEqual = @import("std").testing.expectEqual;

pub fn plusMinus(array: []i32) [3]f32 {
    var score = [2]i32{ 0, 0 };
    for (array) |num| {
        if (num > 0) {
            score[0] += 1;
        }
        if (num < 0) {
            score[1] += 1;
        }
    }
    const left: f32 = @divExact(score[0], array.len);
    const right: f32 = @divExact(score[1], array.len);
    const middle = 1 - (left + right);
    return [3]f32{ left, middle, right };
}

test "Determine the ratio of the numbers  0, 0, -1, 1, 1 " {
    var hand = [_]i32{ 0, 0, -1, 1, 1 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.4,
        0.2,
        0.4,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  -4, 3, -9, 0, 4, 1 " {
    var hand = [_]i32{ -4, 3, -9, 0, 4, 1 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.5,
        0.333333,
        0.166667,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  1, -2, -7, 9, 1, -8, -5 " {
    var hand = [_]i32{ 1, -2, -7, 9, 1, -8, -5 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.428571,
        0.571429,
        0.0,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  0, 4, -3, 3, -6 " {
    var hand = [_]i32{ 0, 4, -3, 3, -6 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.4,
        0.4,
        0.2,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  55, 48, 48, 45, 91, 97, 45, 1, 39, 54, 36, 6, 19, 35, 66, 36, 72, 93, 38, 21, 65, 70, 36, 63, 39, 76, 82, 26, 67, 29, 24, 82, 62, 53, 1, 50, 47, 65, 67, 19, 66, 90, 77 " {
    var hand = [_]i32{ 55, 48, 48, 45, 91, 97, 45, 1, 39, 54, 36, 6, 19, 35, 66, 36, 72, 93, 38, 21, 65, 70, 36, 63, 39, 76, 82, 26, 67, 29, 24, 82, 62, 53, 1, 50, 47, 65, 67, 19, 66, 90, 77 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        1.0,
        0.0,
        0.0,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  0, 100, 35, 0, 94, 40, 42, 87, 59, 0 " {
    var hand = [_]i32{ 0, 100, 35, 0, 94, 40, 42, 87, 59, 0 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.7,
        0.0,
        0.3,
    };
    try expectEqual(plusMinus(cards), result);
}

test "Determine the ratio of the numbers  1, 2, 3, -1, -2, -3, 0, 0 " {
    var hand = [_]i32{ 1, 2, 3, -1, -2, -3, 0, 0 };
    const cards: []i32 = hand[0..];
    const result = [3]f32{
        0.375,
        0.375,
        0.250,
    };
    try expectEqual(plusMinus(cards), result);
}
