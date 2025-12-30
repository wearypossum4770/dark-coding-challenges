use std::collections::HashSet;
pub fn second_largest(nums: Vec<i32>) -> i32 {
    let mut set: Vec<i32> = nums.into_iter().collect::<HashSet<_>>().into_iter().collect();
    set.sort_unstable_by(|a, b| b.cmp(a));
    *set.get(1).unwrap_or(&set[0])
}
