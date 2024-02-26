// pub mod roman_to_int;
pub mod grading_students;
// pub mod longest_common_prefix;
pub mod dart_score;
pub mod division;
pub mod find_digits;
pub mod find_pangram;
pub mod is_leap_year;
pub mod palindromic_number;
pub mod plus_one;
pub mod raindrops;
pub mod reverse_string;
pub mod space_age;
pub mod subtraction;
pub mod summation;
pub mod two_sum;
pub mod utopian_tree;
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
