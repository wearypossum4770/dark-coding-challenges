const sqrt = @import("std").math.sqrt;
const power = @import("std").math.pow;

pub fn distance(x: f32, y: f32, a: f32, b: f32) f64 {
    const squared_x: f64 = power((a - x), 2);
    const squared_y: f64 = power((b - x), 2);
    return sqrt(squared_x + squared_y);
}

pub fn distance_from_origin(x: f32, y: f32) f64 {
    return distance(x, y, 0, 0);
}
