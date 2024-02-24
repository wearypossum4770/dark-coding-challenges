const expect = @import("std").testing.expect;
const helpers = @import("./helpers.zig");

pub fn dart_score(x: f32, y: f32) i32 {
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
test "integer subtraction" {
    try expect(dart_score(
        -9.0,
        9.0,
    ) == 0);
    try expect(dart_score(
        0.0,
        10.0,
    ) == 1);
    try expect(dart_score(
        -5.0,
        0.0,
    ) == 5);
    try expect(dart_score(
        0.0,
        -1.0,
    ) == 10);
    try expect(dart_score(
        0.0,
        0.0,
    ) == 10);
    try expect(dart_score(
        -0.1,
        -0.1,
    ) == 10);
    try expect(dart_score(
        0.7,
        0.7,
    ) == 10);
    try expect(dart_score(
        0.8,
        -0.8,
    ) == 5);
    try expect(dart_score(
        -3.5,
        3.5,
    ) == 5);
    try expect(dart_score(
        -3.6,
        -3.6,
    ) == 1);
    try expect(dart_score(
        -7.0,
        7.0,
    ) == 1);
    try expect(dart_score(
        7.1,
        -7.1,
    ) == 0);
    try expect(dart_score(
        0.5,
        -4.0,
    ) == 5);
}
