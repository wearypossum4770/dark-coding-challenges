pub fn num_identical_pairs(nums: Vec<i32>) -> i32 {
    let mut count: i32 = 0;
    let mut left: usize = 0;
    while left < nums.len() {
        let mut right: usize = left + 1;
        while right < nums.len() {
            if nums[left] == nums[right] {
                count += 1;
            }
            right += 1;
        }
        left += 1;
    }
    count 
}
#[cfg(test)]
mod tests {
    use super::num_identical_pairs;
    use rstest::rstest;
    #[rstest]
    #[case(&[1,1,1,1], 6)]
    #[case(&[1,2,3], 0)]
    #[case(&[1,2,3,1,1,3], 4)]

    fn test_num_identical_pairs(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(num_identical_pairs(nums.to_vec()), expected);
    }
}
