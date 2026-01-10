pub fn array_pair_sum(nums: Vec<i32>) -> i32 {
    let mut total: i32 = 0;
    let mut arr = nums;
    arr.sort();

    for i in (0..arr.len()).step_by(2) {
        total += arr[i];
    }
    total
}
#[cfg(test)]
mod tests {
    use super::array_pair_sum;
    use rstest::rstest;
    #[rstest]
    #[case(&[1, 4, 3, 2], 4)]
    #[case(&[6, 2, 6, 5, 1, 2], 9)]
    #[case(&[1, 1], 1)]
    #[case(&[0, 0], 0)]
    #[case(&[-1, -1], -1)]
    #[case(&[10_000, 10_000], 10_000)]
    #[case(&[5, 5, 5, 5], 10)]
    #[case(&[7, 7, 7, 7, 7, 7], 21)]
    #[case(&[1, 2, 3, 4, 5, 6], 9)]
    #[case(&[6, 5, 4, 3, 2, 1], 9)]
    #[case(&[-5, -4, -3, -2], -8)]
    #[case(&[-10, -1, 1, 10], -9)]
    #[case(&[-10_000, 10_000, -9_999, 9_999], -1)]
    #[case(&[1, 100, 2, 99, 3, 98], 100 + 3)]
    #[case(&[0, 0, 0, 0, 0, 0], 0)]
    #[case(&[-10_000, 10_000], -10_000)]
    fn test_array_pair_sum(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(array_pair_sum(nums.to_vec()), expected);
    }
}
