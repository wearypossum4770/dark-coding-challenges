const math = @import("std").math;
const sqrt = math.sqrt;
const power = math.pow;
const multiply = math.mul;

pub fn distance(x: f32, y: f32, a: f32, b: f32) f32 {
    const squared_x: f32 = power(comptime f32, (a - x), 2);
    const squared_y: f32 = power(comptime f32, (b - y), 2);
    return sqrt(squared_x + squared_y);
}

pub fn distance_from_origin(x: f32, y: f32) f32 {
    return distance(x, y, 0, 0);
}

pub fn gigasecond(seconds: usize) usize {
    return 1_000_000_000_000 * seconds;
}
