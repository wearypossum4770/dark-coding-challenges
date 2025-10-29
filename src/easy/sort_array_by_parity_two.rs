pub fn sort_array_by_parity_two(nums: Vec<i32>) -> Vec<i32> {
    let mut result = vec![0; nums.len()];
    let mut even: usize = 0;
    let mut odd: usize = 1;
    for &num in nums.iter() {
        if num % 2 == 0 {
            result[even] = num;
            even += 2;
        } else {
            result[odd] = num;
            odd += 2;
        }
    }
    result
}
#[cfg(test)]
mod tests {
    use super::sort_array_by_parity_two;
    use rstest::rstest;
    #[rstest]
    #[case(&[4,2,5,7], &[4,5,2,7])]
    #[case(&[2,3], &[2,3])]

    fn test_sort_array_by_parity_two(#[case] nums: &[i32], #[case] expected: &[i32]) {
        assert_eq!(sort_array_by_parity_two(nums.to_vec()), expected.to_vec());
    }
}
