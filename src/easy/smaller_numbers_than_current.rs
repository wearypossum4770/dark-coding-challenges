pub fn smaller_numbers_than_current(nums: Vec<i32>) -> Vec<i32> {
    let mut result: Vec<i32> = vec![0; nums.len()];
    for i in 0..nums.len() {
        for j in 0..nums.len() {
            if nums[i] > nums[j] {
                result[i] += 1;
            }
        }
    }
    result
}
