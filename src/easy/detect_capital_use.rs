fn all_lowercase(s: &str) -> bool {
	s.chars().all(|c| c.is_lowercase())
}

fn all_uppercase(s: &str) -> bool {
	s.chars().all(|c| c.is_uppercase())
}

fn detect_capital_use(word: String) -> bool {
	if all_lowercase(word.as_str()) {
		return true;
	}else if all_uppercase(word.as_str()) {
		return true;
	} else {
		let first = word.chars().nth(0).unwrap().is_uppercase();
		return first && all_lowercase(&word[1..]);
	}
}