pub fn find_duplicate_number(nums: Vec<i32>) -> i32 {
    let mut result = vec![0; nums.len()];
    for &num in nums.iter() {
        if result[num as usize] > 0 {
            return num;
        }
        result[num as usize] += 1;
    }
    0
}
