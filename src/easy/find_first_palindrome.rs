use crate::easy::is_palindrome::{self, is_palindrome};

pub fn find_first_palindrome(words: Vec<String>) -> String {
    for word in words.iter() {
        if (is_palindrome(word.to_string())) {
            return word.to_string();
        }
    }
    "".to_string()
}