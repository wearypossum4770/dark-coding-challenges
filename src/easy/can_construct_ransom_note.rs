pub fn can_construct_ransom_note(ransom_note: String, magazine: String) -> bool {
    let mut freq = vec![0; 26];
    for ch in magazine.chars() {
        if ch.is_ascii_alphabetic() {
            let idx = (ch.to_ascii_lowercase() as u8 - b'a') as usize;
            freq[idx] += 1;
        }
    }
    for ch in ransom_note.chars() {
        if ch.is_ascii_alphabetic() {
            let idx = (ch.to_ascii_lowercase() as u8 - b'a') as usize;
            freq[idx] -= 1;
            if freq[idx] < 0 {
                return false;
            }
        }
    }
    true
}

#[cfg(test)]
mod tests {
    use super::can_construct_ransom_note;
    use rstest::rstest;
    #[rstest]
    #[case("a", "b", false)]
    #[case("aa", "aab", true)]
    #[case("a", "a", true)]
    #[case("aa", "ab", false)]
    #[case("abc", "cbad", true)]
    #[case("", "anything", true)]
    #[case("a", "", false)]
    #[case("", "", true)]
    #[case("aA", "aa", true)]
    #[case("Aa", "aA", true)]
    #[case("zzz", "zzzzzz", true)]
    #[case("zzzz", "zzz", false)]
    #[case("hello world", "dlrowolleh", true)]
    fn test_can_construct_ransom_note(
        #[case] note: String,
        #[case] magazine: String,
        #[case] expected: bool,
    ) {
        assert_eq!(can_construct_ransom_note(note, magazine), expected);
    }
}
