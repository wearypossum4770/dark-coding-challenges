pub fn maximum_gap(nums: Vec<i32>) -> i32 {
    if nums.len() < 2 {
        return 0;
    }
    let mut arr = nums.clone();
    arr.sort();
    let mut result = arr[1] - arr[0];
    for i in 1..arr.len() - 1 {
        result = result.max(arr[i + 1] - arr[i]);
    }
    result
}
