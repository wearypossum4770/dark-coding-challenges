pub fn height_checker(heights: Vec<i32>) -> i32 {
	let mut count: i32 = 0;
	let mut nums = heights.clone();
	nums.sort();
	for (i, &num ) in nums.iter().enumerate() {
		if  heights[i] != num {
			count += 1;
		}
	}
	count
}
#[cfg(test)]
mod tests {
use super::height_checker;
use rstest::rstest;
#[rstest]
	#[case(vec![1, 1, 4, 2, 1, 3], 3)]
	#[case(vec![5, 1, 2, 3, 4], 5)]
	#[case(vec![1, 2, 3, 4, 5], 0)]
	#[case(vec![10,6,6,10,10,9,8,8,3,3,8,2,1,5,1,9,5,2,7,4,7,7], 22)]
fn test_height_checker(#[case] nums: Vec<i32>, #[case] expected: i32) {
assert_eq!(height_checker(nums), expected);
}
}