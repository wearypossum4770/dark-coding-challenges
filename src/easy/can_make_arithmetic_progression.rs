pub fn can_make_arithmetic_progression(arr: Vec<i32>) -> bool {
    let mut nums = arr.clone();
    nums.sort_unstable();
    let distance = nums[1] - nums[0];
    for i in 1..nums.len() - 1 {
        if nums[i + 1] - nums[i] != distance {
            return false;
        }
    }

    true
}
