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
#[cfg(test)]
mod tests {
use super::reverse_string;
use rstest::rstest;

#[rstest]
#[case(&mut vec!['h', 'e', 'l', 'l', 'o'], &vec!['o', 'l', 'l', 'e', 'h'])]
#[case(&mut vec!['a', 'b', 'c', 'd'], &vec!['d', 'c', 'b', 'a'])]
#[case(&mut vec!['z'], &vec!['z'])]
#[case(&mut vec![], &vec![])]
fn test_reverse_string(#[case] input: &mut [char], #[case] expected: &Vec<char>) {
	reverse_string(input);
	assert_eq!(input, expected);
	}
}