pub fn backspace_compare(s: String, t: String) -> bool {
 fn process(text: String) -> String {
	let mut stack = Vec::new();
	for c in text.chars() {
		if c == '#' {
			stack.pop();
		}else {
			stack.push(c);
		}
	}
	stack.iter().collect()
 }
 process(s) == process(t)
}
