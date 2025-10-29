pub fn sort_array_by_parity(arr:  Vec<i32>) -> Vec<i32> {
    let mut nums = vec![0; arr.len()];
    
    let mut even: usize = 0;
    let mut odd: usize = nums.len() - 1;
    for &num in arr.iter(){
        if num % 2 == 0 {
            nums[even] = num;
            even += 1;
        }else {
            nums[odd] = num;
            odd -= 1;
        }
    }
    nums
}