pub fn max_sub_array(nums: Vec<i32>) -> i32 {
let mut result = nums[0];
let mut end = nums[0];
for i in 1..nums.len() {
	end = nums[i].max(end + nums[i]);
	result = result.max(end);
}
result

}