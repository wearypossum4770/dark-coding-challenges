pub fn remove_optional_element(input: &mut [Option<i32>], target: i32) -> i32 {
    let mut count = 0;
    for num in input.iter_mut() {
        if let Some(val) = num {
            if *val == target {
                *num = None;
            } else {
                count += 1;
            }
        }
    }
    count
}
pub fn remove_element(nums: &mut Vec<i32>, target: i32) -> i32 {
    let mut count = 0;
    for index in 0..nums.len() {
        if nums[index] != target {
            nums[count] = nums[index];
            count += 1;
        }
    }
    count as i32
}
