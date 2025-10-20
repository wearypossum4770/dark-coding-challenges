pub fn find_lucky(arr: Vec<i32>) -> i32 {
    let max = arr.iter().max().unwrap_or(&0) + 1;
    let mut nums = vec![0; max as usize + 1];
    arr.iter().for_each(|&x| nums[x as usize] += 1);
    let mut index = nums.len() - 1;
    while index > 0 {
        if index == nums[index] {
            return index as i32;
        }
        index -= 1
    }
    -1
}
#[cfg(test)]
mod tests {
    use super::find_lucky;
    use rstest::rstest;
    #[rstest]
			#[case(&[2,2,3,4], 2)]
			#[case(&[1,2,2,3,3,3], 3)]
			#[case(&[2,2,2,3,3], -1)]
			#[case(&[], -1)]
			#[case(&[0, 0, 0], -1)]
			#[case(&[1], 1)]
			#[case(&[2], -1)]
			#[case(&[2, 2, 3, 3, 3], 3)]
			#[case(&[1, 1, 2, 2], 2)]
			#[case(&[4, 4, 4, 4], 4)]
			#[case(&[7, 7, 7], -1)]
			#[case(&[0, 1, 2, 2], 2)]
    fn test_find_lucky(#[case] arr: &[i32], #[case] expected: i32) {
        assert_eq!(find_lucky(arr.to_vec()), expected);
    }
}
