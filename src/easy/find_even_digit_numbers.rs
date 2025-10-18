pub fn find_even_digit_numbers(nums: Vec<i32>) -> i32 {
    nums.iter()
        .filter(|&num| num.to_string().len() % 2 == 0)
        .count() as i32
}
#[cfg(test)]
mod tests {
    use super::find_even_digit_numbers;
    use rstest::rstest;
    #[rstest]
    #[case(&[12,345,2,6,7896], 2)]
    #[case(&[555,901,482,1771], 1)]
    fn test_find_even_digit_numbers(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(find_even_digit_numbers(nums.to_vec()), expected);
    }
}
