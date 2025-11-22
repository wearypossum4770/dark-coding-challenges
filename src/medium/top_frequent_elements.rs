use std::collections::HashMap;

pub fn top_frequent_elements(nums: Vec<i32>, k: i32) -> Vec<i32> {
    let mut result: Vec<i32> = vec![0; k as usize];
    let mut freq: HashMap<i32, i32> = HashMap::new();
    for n in nums {
        freq.entry(n)
            .and_modify(|c| {
                *c += 1;
            })
            .or_insert(1);
    }
    let mut sorted: Vec<(&i32, &i32)> = freq.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1));
    for i in 0..result.len() {
        result[i] = *sorted[i].0;
    }
    result
}
