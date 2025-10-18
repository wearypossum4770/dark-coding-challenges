pub fn find_even_digit_numbers(nums: Vec<i32>) -> i32 {
    nums.iter()
        .filter(|&num| num.to_string().len() % 2 == 0)
        .count() as i32
}
