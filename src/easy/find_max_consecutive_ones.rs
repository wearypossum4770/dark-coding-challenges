pub fn find_max_consecutive_ones(nums: Vec<i32>) -> i32 {
    let mut count = 0;
    let mut m = 0;
	for &num in nums.iter(){
		if m < count {
			m = count;
		}
		if num == 1 {
			count += 1;
		}else {
			count = 0;
		}
	}
    m.max(count)
}
