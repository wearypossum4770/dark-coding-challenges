pub fn sort_array_by_parity(nums: &mut Vec<i32>) -> Vec<i32> {
    let mut left: usize = 0;
    let mut right: usize = nums.len() - 1;
    while left < right {
        if nums[left] % 2 == 0 {
            left += 1;
        } else if nums[right] % 2 == 1 {
            right -= 1;
        } else {
            nums.swap(left, right);
            left += 1;
            right -= 1;
        }
    }
    nums.to_vec()
}
