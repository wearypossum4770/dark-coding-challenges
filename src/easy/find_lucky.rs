pub fn find_lucky(arr: Vec<i32>) -> i32 {
    let max = arr.iter().max().unwrap_or(&0) + 1;
    let mut nums = vec![0; max as usize + 1];
    arr.iter().for_each(|&x| nums[x as usize] += 1);
    let mut index = nums.len() - 1;
    while index > 0 {
        if index == nums[index] {
            return index as i32;
        }
        index -= 1
    }
    -1
}
