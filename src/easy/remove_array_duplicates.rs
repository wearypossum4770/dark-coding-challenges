pub fn remove_array_duplicates(nums: &mut [i32]) -> i32 {
    if nums.len() <= 1 {
        return 1;
    }
    let mut count = 0;
    for &num in nums.to_owned().iter() {
        if nums[count] != num {
            count += 1;
            nums[count] = num;
        }
    }
    (count + 1) as i32
}
#[cfg(test)]
mod tests {
    use super::remove_array_duplicates;
    use rstest::rstest;
    #[rstest]
    #[case(&mut vec![1, 1, 2], 2)]
    #[case(&mut vec![1, 2, 2, 3, 3], 3)]
    #[case(&mut vec![1, 1, 2, 2, 3, 3, 4], 4)]
    #[case(&mut vec![0], 0)]
    
    fn test_remove_array_duplicates(#[case] nums: &mut Vec<i32>, #[case] expected: i32) {
        assert_eq!(remove_array_duplicates(nums), expected);
    }
}
