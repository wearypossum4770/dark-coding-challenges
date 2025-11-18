pub fn find_error_nums(nums: Vec<i32>) -> Vec<i32> {
    let mut result: Vec<i32> = vec![0; nums.len()];
    let mut target: Vec<i32> = vec![0; 2];
    for n in nums.iter() {
        let index = n.saturating_sub(1) as usize;
        if result[index] > 0 {
            target[0] = *n;
        } else {
            result[index] = *n;
        }
    }
    for i in 0..result.len() {
        if result[i] == 0 {
            target[1] = (i + 1) as i32;
        }
    }
    target
}
