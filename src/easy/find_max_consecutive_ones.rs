pub fn find_max_consecutive_ones(nums: Vec<i32>) -> i32 {
    let mut count = 0;
    let mut m = 0;
    for &num in nums.iter() {
        if m < count {
            m = count;
        }
        if num == 1 {
            count += 1;
        } else {
            count = 0;
        }
    }
    m.max(count)
}
#[cfg(test)]
mod tests {
    use super::find_max_consecutive_ones;
    use rstest::rstest;
    #[rstest]
    #[case(vec![1,1,0,1,1,1], 3)]
    #[case(vec![1,0,1,1,0,1], 2)]
    #[case(vec![0], 0)]
    #[case(vec![1], 1)]
    #[case(vec![1, 1, 1, 1], 4)]
    fn test_find_max_consecutive_ones(#[case] nums: Vec<i32>, #[case] expected: i32) {
        assert_eq!(find_max_consecutive_ones(nums), expected);
    }
}
