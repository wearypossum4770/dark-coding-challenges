pub fn get_array_concatenation(nums: Vec<i32>) -> Vec<i32> {
    let mut answer = vec![0; nums.len() * 2];
    for i in 0..nums.len() {
        answer[i] = nums[i];
        answer[i + nums.len()] = nums[i];
    }

    answer
}
