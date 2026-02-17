use std::collections::HashSet;

pub fn contains_duplicate(nums: Vec<i32>) -> bool {
    let mut unique: HashSet<i32> = HashSet::new();
    for n in &nums {
        if unique.contains(n) {
            return true;
        }
        unique.insert(*n);
    }
    false
}
