use std::collections::HashMap;

pub fn contains_nearby_duplicate(nums: Vec<i32>, k: i32) -> bool {
    let mut seen: HashMap<i32, usize> = HashMap::new();
    for (i, &num) in nums.iter().enumerate() {
        if let Some(&n) = seen.get(&num) {
            if i.abs_diff(n) <= k as usize {
                return true;
            }
        }
        seen.insert(num, i);
    }

    false
}
