use std::collections::HashMap;

pub fn sort_array(nums: Vec<i32>) -> Vec<i32> {
    let mut freq: HashMap<i32, i32> = HashMap::with_capacity(nums.len());
    if nums.is_empty() {
        return nums;
    }

    let mut result: Vec<i32> = vec![0; nums.len()];
    let mut max = nums[0];
    let mut min = nums[0];
    let mut index: usize = 0;
    for &num in &nums {
        freq.entry(num).and_modify(|x| *x += 1).or_insert(1);
        if max < num {
            max = num;
        }
        if min > num {
            min = num;
        }
    }
    for i in min..=max {
        if let Some(count) = freq.get_mut(&i) {
            while count > &mut 0 {
                *count -= 1;
                result[index] = i;
                index += 1;
            }
        }
    }
    result
}

