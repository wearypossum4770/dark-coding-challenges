use std::collections::HashMap;

pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let mut mapper: HashMap<i32, usize> = HashMap::new();
    for (index, &num) in nums.iter().enumerate() {
        if let Some(&value) = mapper.get(&(target - num)) {
            return vec![value as i32, index as i32];
        }
        mapper.insert(num, index);
    }
    vec![]
}
