pub fn missing_number(nums: Vec<i32>) -> i32 {
    let length: i32 = nums.len() as i32;
    let approximate: i32 = length * (length + 1) / 2;
    let total: i32 = nums.iter().sum();
    approximate - total
}
