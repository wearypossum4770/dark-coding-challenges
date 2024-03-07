mod age_to_days;
mod array_pop;
mod basketball_points;
mod circuit_power;
mod cubed_number;
mod dart_score;
mod division;
mod find_digits;
mod find_pangram;
mod find_perimeter;
mod give_me_something;
mod grading_students;
mod hours_to_seconds;
mod is_leap_year;
mod less_than_or_equal_to_zero;
mod longest_common_prefix;
mod minutes_to_seconds;
mod next_gigasecond;
mod next_integer;
mod number_squared;
mod palindromic_number;
mod plus_one;
mod raindrops;
mod remainder;
mod reverse_string;
mod space_age;
mod subtraction;
mod sum_polygon;
mod summation;
mod triangle_area;
mod triangle_next_edge;
mod two_sum;
mod utopian_tree;
// -------------------imports-------------------//
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
