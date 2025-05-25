pub fn to_goat_latin(sentence: &str) -> String {
    if sentence.is_empty() {
        return String::new();
    }

    let vowels = vec!['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
    let mut result = String::new();
    let words: Vec<&str> = sentence.split_whitespace().collect();

    for (i, word) in words.iter().enumerate() {
        let suffix = "a".repeat(i + 1);

        if vowels.contains(&word.chars().next().unwrap()) {
            result.push_str(&format!("{}ma{} ", word, suffix));
        } else {
            let first_char = word.chars().next().unwrap();
            let rest_of_word = &word[1..];
            result.push_str(&format!("{}{}ma{} ", rest_of_word, first_char, suffix));
        }
    }
    result.trim_end().to_string()
}
#[cfg(test)]
mod tests {
    use super::to_goat_latin;
    use rstest::rstest;
    #[rstest]
    #[case("I speak Goat Latin", "Imaa peaksmaaa oatGmaaaa atinLmaaaaa".to_string())]
    #[case("The quick brown fox jumped over the lazy dog","heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa".to_string())]
    #[case("HZ sg L", "ZHmaa gsmaaa Lmaaaa".to_string())]
    fn test_to_goat_latin(#[case] sentence: &str, #[case] expected: String) {
        assert_eq!(to_goat_latin(sentence), expected);
    }
}
