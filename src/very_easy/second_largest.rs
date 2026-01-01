use std::collections::HashSet;
pub fn second_largest(nums: Vec<i32>) -> i32 {
    let mut set: Vec<i32> = nums
        .into_iter()
        .collect::<HashSet<_>>()
        .into_iter()
        .collect();
    set.sort_unstable_by(|a, b| b.cmp(a));
    *set.get(1).unwrap_or(&set[0])
}
#[cfg(test)]
mod tests {
    use super::second_largest;
    use rstest::rstest;
    #[rstest]
    #[case(&[10, 40, 30, 20, 50], 40)]
    #[case(&[25, 143, 89, 13, 105], 105)]
    #[case(&[54, 23, 11, 17, 10], 23)]
    #[case(&[513, 211, 131, 417, 11], 417)]
    #[case(&[63, 44, 11, 22, 33, 66, 65], 65)]
    #[case(&[5, 5, 3], 3)]
    #[case(&[5, 5, 5, 4], 4)]
    #[case(&[1, 2, 2, 1], 1)]
    #[case(&[3, 3, 2, 2, 1], 2)]
    #[case(&[-1, -2, -3], -2)]
    #[case(&[-10, -20, -30, -40], -20)]
    #[case(&[-5, -1, -3], -3)]
    #[case(&[-10, 0, 10], 0)]
    #[case(&[0, -1, 1], 0)]
    #[case(&[-1, -1, 0], -1)]
    fn test_second_largest(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(second_largest(nums.to_vec()), expected);
    }
}
