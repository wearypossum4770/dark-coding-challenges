const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const TextTools = @import("text_tools.zig");

pub fn checkPerfectNumber(n: u64) bool {
    if (n <= 0) return false;
    if (n == 1) return false;
    return n == calculatePerfectNumber(n);
}
pub fn classifyPerfectNumber(n: u64) []const u8 {
    const num = calculatePerfectNumber(n);
    if (n < num) return "abundant";
    if (n > num) return "deficient";
    return "perfect";
}
pub fn calculatePerfectNumber(n: usize) u64 {
    if (n == 1) return 0;
    const root = std.math.sqrt(n);
    var total: u64 = 1;
    var index: usize = 2;
    while (index <= root) : (index += 1) {
        if (@mod(n, index) == 0) {
            total += index;
            const other = n / index;
            if (other != index) total += other;
        }
    }
    return total;
}
test "496 is a perfect number" {
    const classification = "perfect";
    const n: usize = 496;
    const actual = checkPerfectNumber(n);

    const expected = classifyPerfectNumber(n);
    try expectEqualSlices(u8, classification, expected);
    try expectEqual(true, actual);
}
test "8128 is a perfect number" {
    const classification = "perfect";
    const n: usize = 8128;
    const actual = checkPerfectNumber(n);

    const expected = classifyPerfectNumber(n);
    try expectEqualSlices(u8, classification, expected);
    try expectEqual(true, actual);
}
test "8589869056 is a perfect number" {
    const classification = "perfect";
    const n: usize = 8589869056;
    const actual = checkPerfectNumber(n);

    const expected = classifyPerfectNumber(n);
    try expectEqualSlices(u8, classification, expected);
    try expectEqual(true, actual);
}
test "137438691328 is a perfect number" {
    const classification = "perfect";
    const n: usize = 137438691328;
    const actual = checkPerfectNumber(n);

    const expected = classifyPerfectNumber(n);
    try expectEqualSlices(u8, classification, expected);
    try expectEqual(true, actual);
}

test "Smallest perfect number is classified correctly" {
    const classification = "perfect";
    const n: usize = 6;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Medium perfect number is classified correctly" {
    const classification = "perfect";
    const n: usize = 28;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Large perfect number is classified correctly" {
    const classification = "perfect";
    const n: usize = 33550336;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}

test "Smallest abundant number is classified correctly" {
    const classification = "abundant";
    const n: usize = 12;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Medium abundant number is classified correctly" {
    const classification = "abundant";
    const n: usize = 30;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Large abundant number is classified correctly" {
    const classification = "abundant";
    const n: usize = 33550335;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}

test "Smallest prime deficient number is classified correctly" {
    const classification = "deficient";
    const n: usize = 2;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Smallest non-prime deficient number is classified correctly" {
    const classification = "deficient";
    const n: usize = 4;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Medium deficient number is classified correctly" {
    const classification = "deficient";
    const n: usize = 32;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
test "Large deficient number is classified correctly" {
    const classification = "deficient";
    const n: usize = 33550337;
    const actual = checkPerfectNumber(n);
    const ultimate = TextTools.sliceInOrderEquals(u8, classification, "perfect");
    const expected = classifyPerfectNumber(n);
    try expectEqual(ultimate, actual);
    try expectEqualSlices(u8, classification, expected);
}
