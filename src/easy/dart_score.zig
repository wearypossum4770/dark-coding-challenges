const std = @import("std");
const testing = std.testing;
const helpers = @import("./helpers.zig");

pub fn dartScore(x: f32, y: f32) i32 {
    const point: f32 = helpers.distance_from_origin(x, y);
    if (point <= 10.0 and point > 5.0) {
        return 1;
    }
    if (point <= 5.0 and point > 1.0) {
        return 5;
    }
    if (point <= 1.0) {
        return 10;
    }
    return 0;
}

test "missed target" {
    const expected: i32 = 0;
    const actual = dartScore(-9.0, 9.0);
    try testing.expectEqual(expected, actual);
}
test "on the outer circle" {
    const expected: i32 = 1;
    const actual = dartScore(0.0, 10.0);
    try testing.expectEqual(expected, actual);
}
test "on the middle circle" {
    const expected: i32 = 5;
    const actual = dartScore(-5.0, 0.0);
    try testing.expectEqual(expected, actual);
}
test "on the inner circle" {
    const expected: i32 = 10;
    const actual = dartScore(0.0, -1.0);
    try testing.expectEqual(expected, actual);
}
test "exactly on center" {
    const expected: i32 = 10;
    const actual = dartScore(0.0, 0.0);
    try testing.expectEqual(expected, actual);
}
test "near the center" {
    const expected: i32 = 10;
    const actual = dartScore(-0.1, -0.1);
    try testing.expectEqual(expected, actual);
}
test "just within the inner circle" {
    const expected: i32 = 10;
    const actual = dartScore(0.7, 0.7);
    try testing.expectEqual(expected, actual);
}
test "just outside the inner circle" {
    const expected: i32 = 5;
    const actual = dartScore(0.8, -0.8);
    try testing.expectEqual(expected, actual);
}
test "just within the middle circle" {
    const expected: i32 = 5;
    const actual = dartScore(3.5, -3.5);
    try testing.expectEqual(expected, actual);
}
test "just outside the middle circle" {
    const expected: i32 = 1;
    const actual = dartScore(-3.6, -3.6);
    try testing.expectEqual(expected, actual);
}
test "just within the outer circle" {
    const expected: i32 = 1;
    const actual = dartScore(-7.0, 7.0);
    try testing.expectEqual(expected, actual);
}
test "just outside the outer circle" {
    const expected: i32 = 0;
    const actual = dartScore(7.1, -7.1);
    try testing.expectEqual(expected, actual);
}
test "asymmetric position between the inner and middle circles" {
    const expected: i32 = 5;
    const actual = dartScore(0.5, -4.0);
    try testing.expectEqual(expected, actual);
}

test "just outside the middle circle" {
    const expected: usize = 5;
    const x: f32 = 0.5;
    const y: f32 = -4.0;
    const actual = Coordinate.init(x, y);
    try testing.expectEqual(actual.y_coord, y);
    try testing.expectEqual(actual.x_coord, x);
    try testing.expectEqual(actual.score(), expected);
}
pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x_coord: f32,
    y_coord: f32,
    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x_coord = x_coord,
            .y_coord = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        const point: f32 = helpers.distance_from_origin(self.x_coord, self.y_coord);

        if (point <= 10.0 and point > 5.0) return 1;
        if (point <= 5.0 and point > 1.0) return 5;
        if (point <= 1.0) return 10;
        return 0;
    }
};
