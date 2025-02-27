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
