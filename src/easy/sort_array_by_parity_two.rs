pub fn sort_array_by_parity_two(nums: Vec<i32>) -> Vec<i32> {
    let mut result = vec![0; nums.len()];
    let mut even: usize = 0;
    let mut odd: usize = 1;
    for &num in nums.iter() {
        if num % 2 == 0 {
            result[even] = num;
            even += 2;
        } else {
            result[odd] = num;
            odd += 2;
        }
    }
    result
}
