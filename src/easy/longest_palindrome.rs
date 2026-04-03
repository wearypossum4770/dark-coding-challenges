use std::collections::HashMap;

pub fn longest_palindrome(s: String) -> i32 {
let mut freq: HashMap<char, usize> = HashMap::new();
	for c in s.chars() {
		freq.entry(c).and_modify(|x| *x += 1).or_insert(1);
	}
	let odds = freq.values().filter(|&count| count % 2 == 1).count();
	if odds > 1 {
		return (s.len() - odds + 1) as i32;
	}
	s.len() as i32

}
