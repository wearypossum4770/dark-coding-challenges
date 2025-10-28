use crate::easy::is_palindrome::{self, is_palindrome};

pub fn find_first_palindrome(words: Vec<String>) -> String {
    for word in words.iter() {
        if (is_palindrome(word.to_string())) {
            return word.to_string();
        }
    }
    "".to_string()
}
#[cfg(test)]
mod tests {
    use super::find_first_palindrome;
    use rstest::rstest;
    #[rstest]
    #[case(&["abc","car","ada","racecar","cool"], "ada")]
    #[case(&["notapalindrome","racecar"], "racecar")]
    #[case(&["def","ghi"], "")]
    fn test_find_first_palindrome(#[case] words: &[&str], #[case] expected: &str) {
        assert_eq!(
            find_first_palindrome(words.iter().map(|w| w.to_string()).collect()),
            expected.to_string()
        );
    }
}
