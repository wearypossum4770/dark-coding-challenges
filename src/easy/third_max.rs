use std::collections::HashSet;

pub fn third_max(nums: Vec<i32>) -> i32 {
    let mut set: Vec<i32> = nums
        .into_iter()
        .collect::<HashSet<_>>()
        .into_iter()
        .collect();
    set.sort_unstable_by(|a, b| b.cmp(a));
    *set.get(2).unwrap_or(&set[0])
}
#[cfg(test)]
mod tests {
    use super::third_max;
    use rstest::rstest;
    #[rstest]
    #[case(&[1, 2, 3, 4, 5], 3)]
    #[case(&[5, 4, 3, 2, 1], 3)]
    #[case(&[10, 20, 30, 40], 20)]
    #[case(&[3, 2, 1], 1)]
    #[case(&[5, 5, 3, 2], 2)]
    #[case(&[1, 2, 2, 3, 3], 1)]
    #[case(&[-1, -2, -3, -4], -3)]
    #[case(&[-10, -20, -30], -30)]
    #[case(&[-10, 0, 10], -10)]
    #[case(&[0, -1, 1, 2], 0)]
    fn test_third_max(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(third_max(nums.to_vec()), expected);
    }
}
