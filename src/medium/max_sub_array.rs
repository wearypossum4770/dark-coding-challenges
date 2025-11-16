pub fn max_sub_array(nums: Vec<i32>) -> i32 {
let mut result = nums[0];
let mut end = nums[0];
for i in 1..nums.len() {
	end = nums[i].max(end + nums[i]);
	result = result.max(end);
}
result

}
#[cfg(test)]
mod tests {
use super::max_sub_array;
use rstest::rstest;
#[rstest]
#[case(&[2, 3, -8, 7, -1, 2, 3], 11)]
#[case(&[-2,1,-3,4,-1,2,1,-5,4], 6)]
#[case(&[1], 1)]
#[case(&[-2, -4], -2)]
#[case(&[5, 4, 1, 7, 8], 25)]
#[case(&[5,4,-1,7,8], 23)]
fn test_max_sub_array(#[case] nums: &[i32], #[case] expected: i32) {
assert_eq!(max_sub_array(nums.to_vec()), expected);
}
}