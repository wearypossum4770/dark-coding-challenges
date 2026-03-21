pub fn reverse_word_prefix(word: String, ch: char) -> String {
let mut result = String::new();

for (i, c) in word.char_indices() {
	if c == ch {
		let mut right = i+1;
	for left in (0..=i).rev(){
			match word.chars().nth(left) {
				None => {},
				Some(d) => {
					result.push(d); 
				},
			};
		}
		while right <= word.len() {
				match word.chars().nth(right) {
					None => {},
					Some(d) => {
						result.push(d);
					},
				};
				right += 1;
		}
		return result;
	}
}
word
}
