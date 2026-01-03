pub fn repeated_substring_pattern(s: String) -> bool {
    if s.is_empty() {
        return true;
    }
    let double = s.repeat(2);
    double[1..double.len() - 1].contains(&s)
}
#[cfg(test)]
mod tests {
    use super::repeated_substring_pattern;
    use rstest::rstest;
    #[rstest]
    #[case("a", false)]
    #[case("aa", true)]
    #[case("ab", false)]
    #[case("aba", false)]
    #[case("abab", true)]
    #[case("ababba", false)]
    #[case("abcabc", true)]
    #[case("abcabcabcabc", true)]
    #[case("abcdabcd", true)]
    #[case("abcdabce", false)]
    #[case("aaaaaaaa", true)]
    #[case("aaaaaaab", false)]
    #[case("abaababaab", true)]
    #[case("abaaba", true)]
    #[case("abaabab", false)]
    #[case("xyzxyzxyz", true)]
    #[case("xyzxy", false)]
    #[case("zz", true)]
    #[case("z", false)]
    #[case("ababababx", false)]
    fn test_repeated_substring_pattern(#[case] s: &str, #[case] expected: bool) {
        assert_eq!(repeated_substring_pattern(s.to_string()), expected);
    }
}
