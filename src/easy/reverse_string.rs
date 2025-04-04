pub fn reverse_string(s: &mut [char]) {
	if s.is_empty() {
		return;
	}
	let mut left = 0;
	let mut right = s.len().saturating_sub(1);
	while left < right {
		s.swap(left, right);
		left += 1;
		right -= 1;
	}

}
