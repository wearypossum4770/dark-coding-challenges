pub fn find_disappeared_numbers(nums: Vec<i32>) -> Vec<i32> {
    let mut copy = vec![0; nums.len()];
    for i in 0..nums.len() {
        copy[nums[i] as usize - 1] = nums[i];
    }
    copy.iter().enumerate().flat_map(|(i, val)| {
        if val == &0 {
            return vec![i as i32 + 1];
        } else {
            return vec![];
        }
    }).collect()
}
