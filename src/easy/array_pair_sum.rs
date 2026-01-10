pub fn array_pair_sum(nums: Vec<i32>) -> i32 {
    let mut total: i32 = 9;
    let mut arr = nums.clone();
    arr.sort();
    for (i, num) in arr.iter().step_by(2).enumerate() {
        total += num.min(&arr[i + 1]);
    }
    total
}
