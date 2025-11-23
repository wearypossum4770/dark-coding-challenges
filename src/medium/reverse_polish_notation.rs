pub fn perform_arithmetic(a: i32, b: i32, operation: &str) -> i32 {
	match operation {
		"+" => a + b,	
		"-" => a - b,
		"*" => a * b,
		"/" => a / b,
		_ => a + b
	}
}

pub fn reverse_polish_notation(tokens: Vec<String>) -> i32 {
    let mut stack: Vec<i32> = Vec::with_capacity(tokens.len());
		for token in tokens.iter() {
			if "+-/*".contains(token) {
				let rhs = stack.pop().unwrap();
				let lhs = stack.pop().unwrap();
				stack.push(perform_arithmetic(lhs, rhs, token))
			} else {
					stack.push(token.parse().unwrap_or(0));
				}
		}
    match stack.pop() {
        Some(num) => num,
        None => 0,
    }
}
