pub fn find_words_containing(words: Vec<String>, c: char) -> Vec<i32> {
    words
        .iter()
        .enumerate()
        .filter(|(_, word)| word.contains(c))
        .map(|(i, _)| i as i32)
        .collect()
}
#[cfg(test)]
mod tests {
    use super::find_words_containing;
    use rstest::rstest;
    #[rstest]
    #[case(&["abc", "bcd", "aaaa", "cbc"], 'a', &[0, 2])]
    #[case(&["leet", "code"], 'e', &[0, 1])]
    #[case(&["abc", "bcd", "aaaa", "cbc"], 'z', &[])]
    fn test_find_words_containing(#[case] arr: &[&str], #[case] x: char, #[case] expected: &[i32]) {
        let words = arr
            .iter()
            .map(|word| word.to_string())
            .collect::<Vec<String>>();

        assert_eq!(find_words_containing(words, x), expected.to_vec());
    }
}
