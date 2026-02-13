pub fn minimum_absolute_difference(arr: Vec<i32>) -> Vec<Vec<i32>> {
    let mut result = Vec::new();
    let mut nums = arr.clone();
    nums.sort();
    let mut m = i32::MAX;
    for i in 0..nums.len() - 1 {
        let diff = nums[i + 1] - nums[i];
        if m > diff {
            m = diff;
            result.clear();
            result.push(vec![nums[i], nums[i + 1]]);
        } else if m == diff {
            result.push(vec![nums[i], nums[i + 1]]);
        }
    }
    result
}
