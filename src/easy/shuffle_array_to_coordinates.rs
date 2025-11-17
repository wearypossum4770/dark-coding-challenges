pub fn shuffle_array_to_coordinates(nums: Vec<i32>, n: i32) -> Vec<i32> {
    let mut result = vec![0; nums.len()];
    for i in 0..n {
        let index = i as usize;
        result[2 * index] = nums[index];
        result[2 * index + 1] = nums[(i + n) as usize];
    }
    result
}
#[cfg(test)]
mod tests {
    use super::shuffle_array_to_coordinates;
    use rstest::rstest;
    #[rstest]
    #[case(&[2,5,1,3,4,7],  3, &[2,3,5,4,1,7])]
    #[case(&[1,2,3,4,4,3,2,1], 4, &[1,4,2,3,3,2,4,1])]
    #[case(&[1,1,2,2], 2, &[1,2,1,2])]
    fn test_shuffle_array_to_coordinates(
        #[case] nums: &[i32],
        #[case] n: i32,
        #[case] expected: &[i32],
    ) {
        assert_eq!(
            shuffle_array_to_coordinates(nums.to_vec(), n),
            expected.to_vec()
        );
    }
}
