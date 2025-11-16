pub fn get_array_concatenation(nums: Vec<i32>) -> Vec<i32> {
    let mut answer = vec![0; nums.len() * 2];
    for i in 0..nums.len() {
        answer[i] = nums[i];
        answer[i + nums.len()] = nums[i];
    }

    answer
}
#[cfg(test)]
mod tests {
    use super::get_array_concatenation;
    use rstest::rstest;
    #[rstest]
    #[case(&[1,2,1], &[1,2,1,1,2,1])]
    #[case(&[1,3,2,1], &[1,3,2,1,1,3,2,1])]
    #[case(&[1], &[1, 1])]
    #[case(&[1000], &[1000, 1000])]
    #[case(&[1, 1, 1], &[1, 1, 1, 1, 1, 1])]
    #[case(&[2, 4, 6], &[2, 4, 6, 2, 4, 6])]
    #[case(&[5, 10], &[5, 10, 5, 10])]
    #[case(&[0, 1, 0], &[0, 1, 0, 0, 1, 0])]
    #[case(&[1, 2, 3, 2, 1], &[1, 2, 3, 2, 1, 1, 2, 3, 2, 1])]

    fn test_get_array_concatenation(#[case] nums: &[i32], #[case] expected: &[i32]) {
        assert_eq!(get_array_concatenation(nums.to_vec()), expected.to_vec());
    }
}
