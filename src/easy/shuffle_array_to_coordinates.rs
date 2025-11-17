pub fn shuffle_array_to_coordinates(nums: Vec<i32>, n: i32) -> Vec<i32> {
    let mut result = vec![0; nums.len()];
    for i in 0..n {
        let index = i as usize;
        result[2 * index] = nums[index];
        result[2 * index + 1] = nums[(i + n) as usize];
    }
    result
}
