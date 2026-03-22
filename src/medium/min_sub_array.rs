use std::collections::HashMap;

pub fn min_sub_array(nums: Vec<i32>, p: i32) -> i32 {
    let total = (nums.iter().map(|&x| x as i64).sum::<i64>() % p as i64) as i32;
    if total == 0 {
        return 0;
    }

    let mut prefix_map: HashMap<i32, usize> = HashMap::from([(0, usize::MAX)]);
    let mut prefix_sum = 0;
    let mut min_length = nums.len();

    for (i, &num) in nums.iter().enumerate() {
        prefix_sum = (prefix_sum + num) % p;
        let need = (prefix_sum - total + p) % p;
        if let Some(&previous_index) = prefix_map.get(&need) {
            min_length = min_length.min(i - previous_index);
        }
        prefix_map.insert(prefix_sum, i);
    }

    if min_length == nums.len() {
        -1
    } else {
        min_length.try_into().unwrap()
    }
}
