pub fn sort_array_by_parity(arr: Vec<i32>) -> Vec<i32> {
    let mut nums = vec![0; arr.len()];

    let mut even: usize = 0;
    let mut odd: usize = nums.len() - 1;
    for &num in arr.iter() {
        if num % 2 == 0 {
            nums[even] = num;
            even += 1;
        } else {
            nums[odd] = num;
            odd -= 1;
        }
    }
    nums
}
#[cfg(test)]
mod tests {
    use super::sort_array_by_parity;
    use rstest::rstest;
    #[rstest]
    #[case(&[3, 1, 2, 4], &[2,4,1,3])]
    #[case(&[0, 1, 2], &[0, 2, 1])]
    #[case(&[0], &[0])]

    fn test_sort_array_by_parity(#[case] arr: &[i32], #[case] expected: &[i32]) {
        assert_eq!(sort_array_by_parity(arr.to_vec()), expected.to_vec());
    }
}
