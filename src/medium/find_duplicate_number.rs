pub fn find_duplicate_number(nums: Vec<i32>) -> i32 {
    let mut result = vec![0; nums.len()];
    for &num in nums.iter() {
        if result[num as usize] > 0 {
            return num;
        }
        result[num as usize] += 1;
    }
    0
}
#[cfg(test)]
mod tests {
    use super::find_duplicate_number;
    use rstest::rstest;
    #[rstest]
    #[case(&[1,1], 1)]
    #[case(&[1,3,4,2,2], 2)]
    #[case(&[3,1,3,4,2], 3)]
    #[case(&[3,3,3,3,3], 3)]
    #[case(&[2,1,2], 2)]
    #[case(&[1,4,6,3,2,5,6], 6)]
    #[case(&[5,4,3,2,1,5], 5)]
    #[case(&[1,2,3,4,5,6,7,8,9,9], 9)]
    #[case(&[2,2,2,2,2], 2)]
    #[case(&[1,1,2,3,4,5], 1)]
    #[case(&[4,3,1,4,2], 4)]
    #[case(&[6,1,5,4,3,2,6], 6)]
    #[case(&[1,2,3,4,5,3], 3)]
    #[case(&[7,6,5,4,3,2,1,7], 7)]
    fn test_find_duplicate_number(#[case] nums: &[i32], #[case] expected: i32) {
        assert_eq!(find_duplicate_number(nums.to_vec()), expected);
    }
}
