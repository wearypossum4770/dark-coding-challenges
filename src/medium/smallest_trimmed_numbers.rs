struct Rank <'a>{
	index: usize,
	value: &'a str
}
impl <'a> Rank<'a> {
	pub fn new(index: usize, value: &'a str) -> Self {
		Self { index, value }
	}
}
pub fn smallest_trimmed_numbers(nums: Vec<String>, queries: Vec<Vec<i32>>) -> Vec<i32> {
	let mut result: Vec<i32> = vec![0; 0];
	for query in &queries {
		let rank = query[0] as usize;
		let digit = query[1] as usize;
		let mut trimmed: Vec<Rank> = nums.iter().enumerate().map(|(index, num)| {
			let value = num.split_at(num.len().saturating_sub(digit));
			Rank::new(index, value.1)
		}).collect();
		trimmed.sort_by(|a, b| a.value.cmp(b.value).then(a.index.cmp(&b.index)));
		result.push(trimmed[rank.saturating_sub(1)].index as i32);
	}
    result
}
