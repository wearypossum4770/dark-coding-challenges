pub fn maximum_gap(nums: Vec<i32>) -> i32 {
    if nums.len() < 2 {
        return 0;
    }
    let mut arr = nums.clone();
    arr.sort();
    let mut result = arr[1] - arr[0];
    for i in 1..arr.len() - 1 {
        result = result.max(arr[i + 1] - arr[i]);
    }
    result
}
#[cfg(test)]
mod tests {
    use super::maximum_gap;
    use rstest::rstest;
    #[rstest]
    #[case(&[3, 6, 9, 1], 3)]
    #[case(&[10], 0)]
    #[case(&[1, 100], 99)]
    #[case(&[1, 2, 3, 4, 5], 1)]
    #[case(&[10, 9, 8, 7], 1)]
    #[case(&[7, 7, 7, 7], 0)]
    #[case(&[0, 1_000_000_000], 1_000_000_000)]
    #[case(&[1, 100, 2, 50_000_000], 49999900)]
    #[case(&[1, 1], 0)]
    #[case(&[2, 2, 2, 3], 1)]
    #[case(&[100, 3, 2, 1], 97)]
    #[case(&[1, 3, 1_000, 2_000], 1_000)]
    #[case(&[8, 1, 6, 3, 9], 3)]
    #[case(&[5, 4, 3, 2, 1], 1)]
    #[case(&[1, 2], 1)]
    #[case(&[1_000_000_000, 0, 999_999_999], 999_999_999)]
    #[case(&[1, 4, 7, 13, 20, 21], 7)]
    #[case(&[5, 5, 5, 10], 5)]
    #[case(&[0, 1, 2, 3, 100], 97)]
    #[case(&[100, 200, 300, 1_000], 700)]
    fn test_maximum_gap(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(maximum_gap(nums.to_vec()), expected);
    }
}
