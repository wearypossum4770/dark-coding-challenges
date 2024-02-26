pub fn reverse_string(sentence: &str) -> String {
    sentence.chars().rev().collect::<String>()
}
#[cfg(test)]
mod tests {
    use super::reverse_string;
    #[test]
    fn an_empty_string() {
        assert_eq!(reverse_string(&""), "".to_string());
    }
    #[test]
    fn a_word() {
        assert_eq!(reverse_string(&"robot"), "tobor".to_string());
    }
    #[test]
    fn a_capitalized_word() {
        assert_eq!(reverse_string(&"Ramen"), "nemaR".to_string());
    }
    #[test]
    fn a_sentence_with_punctuation() {
        assert_eq!(reverse_string(&"I'm hungry!"), "!yrgnuh m'I".to_string());
    }
    #[test]
    fn a_palindrome() {
        assert_eq!(reverse_string(&"racecar"), "racecar".to_string());
    }
    #[test]
    fn an_even_sized_word() {
        assert_eq!(reverse_string(&"drawer"), "reward".to_string());
    }
    #[test]
    fn wide_characters() {
        assert_eq!(reverse_string(&"子猫"), "猫子".to_string());
    }
    #[test]
    #[cfg(feature = "grapheme")]
    fn grapheme_clusters() {
        assert_eq!(reverse_string(&"uüu"), "uüu".to_string());
    }
}
