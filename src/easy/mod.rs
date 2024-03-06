// mod roman_to_int;
mod age_to_days;
mod array_pop;
mod circuit_power;
mod grading_students;
// mod longest_common_prefix;
mod dart_score;
mod division;
mod find_digits;
mod find_pangram;
mod is_leap_year;
mod minutes_to_seconds;
mod next_gigasecond;
mod next_integer;
mod palindromic_number;
mod plus_one;
mod raindrops;
mod reverse_string;
mod space_age;
mod subtraction;
mod summation;
mod triangle_area;
mod two_sum;
mod utopian_tree;

pub fn distance(x: f32, y: f32, a: f32, b: f32) -> f32 {
    let x_diff: f32 = a - x;
    let y_diff: f32 = b - y;
    let squared_x: f32 = x_diff.powi(2);
    let squared_y: f32 = y_diff.powi(2);
    let root: f32 = squared_x + squared_y;
    root.sqrt()
}

pub fn distance_from_origin(x: f32, y: f32) -> f32 {
    distance(x, y, 0.0, 0.0)
}
