use std::collections::HashMap;

pub fn sort_colors(nums: &mut Vec<i32>) {
    let mut freq: HashMap<i32, i32> = HashMap::new();
    for &num in nums.iter() {
        freq.entry(num).and_modify(|x| *x += 1).or_insert(1);
    }
    let mut index: usize = 0;
    for i in 0..3 {
        while freq.get(&i) > Some(&0) {
            nums[index] = i;
            index += 1;
            freq.entry(i).and_modify(|x| *x -= 1);
        }
    }
}
