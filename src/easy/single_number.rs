pub fn single_number(nums: Vec<i32>) -> i32 {
        nums.into_iter().fold(0, |acc, x| acc ^ x)
}
#[cfg(test)]
mod tests {
    use super::single_number;
    use rstest::rstest;
    #[rstest]
    #[case(vec![2,2,1], 1)]
    #[case(vec![4,1,2,1,2], 4)]
    #[case(vec![1], 1)]
    fn test_single_number(#[case] nums: Vec<i32>, #[case] expected: i32) {
        assert_eq!(single_number(nums), expected);
    }
}
