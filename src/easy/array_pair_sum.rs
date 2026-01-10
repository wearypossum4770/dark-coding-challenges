pub fn array_pair_sum(nums: Vec<i32>) -> i32 {
    let mut total: i32 = 0;
    let mut arr = nums;
    arr.sort();
    
    for i in (0..arr.len()).step_by(2){
        total += arr[i];
    }
    total
}
