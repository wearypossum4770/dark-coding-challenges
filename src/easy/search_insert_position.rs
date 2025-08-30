pub fn search_insert_position(nums: Vec<i32>, target: i32) -> usize {
			let mut left: usize = 0;
			let mut right: usize = nums.len().saturating_sub(1);
			while left <= right {
					let mid = left + (right - left) / 2;
					if nums[mid] == target {
							return mid;
					}
					if nums[mid] < target {
							left = mid + 1;
					} else if mid > 0 {
							right = mid - 1;
					} else {
							break;
					}
			}
			left
}
#[cfg(test)]
mod tests {
    use super::search_insert_position;
    use rstest::rstest;
    #[rstest]
    #[case(vec![1,3,5,6], 0, 0)]
    #[case(vec![1, 3, 5, 6], 5, 2)]
    #[case(vec![1, 3, 5, 6], 2, 1)]
    #[case(vec![1, 3, 5, 6], 7, 4)]
    #[case(vec![1], 1, 0)]

    fn test_search_insert_position(
        #[case] nums: Vec<i32>,
        #[case] target: i32,
        #[case] expected: usize,
    ) {
        assert_eq!(search_insert_position(nums, target), expected);
    }
}
