pub fn num_identical_pairs(nums: Vec<i32>) -> i32 {
    let mut count: i32 = 0;
    let mut left: usize = 0;
    while left < nums.len() {
        let mut right: usize = left + 1;
        while right < nums.len() {
            if nums[left] == nums[right] {
                count += 1;
            }
            right += 1;
        }
        left += 1;
    }
    count 
}