pub fn is_palindrome(candidate: String) -> bool {
    let cleaned_chars: Vec<char> = candidate
        .to_lowercase()
        .chars()
        .filter(|letter| letter.is_ascii_alphanumeric())
        .collect::<Vec<char>>();
    let mut right: usize = cleaned_chars.len().saturating_sub(1);
    let mut left: usize = 0;

    while left < right {
        if cleaned_chars[left] != cleaned_chars[right] {
            return false;
        }
        left += 1;
        right = right.saturating_sub(1);
    }
    true
}

pub fn count_palindrome(text: String) -> u32 {
    let mut total: u32 = 0;
    for word in text.split_whitespace() {
        if is_palindrome(word.to_string()) {
            total += 1;
        }
    }
    total
}

#[cfg(test)]
mod tests {
    use super::count_palindrome;
    use rstest::rstest;

    #[rstest]
    #[case("wow mom", 2)]
    #[case("the fastest racecar", 1)]
    fn test_count_palindromes(#[case] input: String, #[case] total: u32) {
        assert_eq!(count_palindrome(input), total);
    }
}
