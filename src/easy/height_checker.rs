pub fn height_checker(heights: Vec<i32>) -> i32 {
	let mut count: i32 = 0;
	let mut nums = heights.clone();
	nums.sort();
	for (i, &num ) in nums.iter().enumerate() {
		if  heights[i] != num {
			count += 1;
		}
	}
	count
}