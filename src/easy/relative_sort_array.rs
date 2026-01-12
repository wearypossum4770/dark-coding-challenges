use std::collections::HashMap;

pub fn relative_sort_array(arr1: Vec<i32>, arr2: Vec<i32>) -> Vec<i32> {
let mut result = vec![0; arr1.len()];
let mut freq: HashMap<i32, i32> = HashMap::with_capacity(arr1.len());
let mut index: usize = 0;
	for &num in &arr1 {
		*freq.entry(num).or_insert(0) += 1;
	}
	for &num in &arr2 {
		if let Some(&count) = freq.get(&num) {
			for _ in 0..count {
				result[index] = num;
				index += 1;
			}
			freq.remove(&num);
		}
	}
	let mut keys: Vec<i32> = freq.keys().copied().collect();
	keys.sort();

	for num in keys {
			if let Some(&count) = freq.get(&num) {
			for _ in 0..count {
				result[index] = num;
				index += 1;
			}
		}
	
		}
result

}
