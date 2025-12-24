fn all_lowercase(s: &str) -> bool {
    s.chars().all(|c| c.is_lowercase())
}

fn all_uppercase(s: &str) -> bool {
    s.chars().all(|c| c.is_uppercase())
}

fn detect_capital_use(word: String) -> bool {
    if all_lowercase(word.as_str()) {
        return true;
    } else if all_uppercase(word.as_str()) {
        return true;
    } else {
        let first = word.chars().nth(0).unwrap().is_uppercase();
        return first && all_lowercase(&word[1..]);
    }
}
#[cfg(test)]
mod tests {
    use super::detect_capital_use;
    use rstest::rstest;
    #[rstest]
    #[case("USA", true)]
    #[case("UsA", false)]
    #[case("leetcode", true)]
    #[case("Google", true)]
    #[case("FlaG", false)]
    #[case("g", true)]
    #[case("G", true)]
    #[case("LeetCode", false)]
    #[case("aPPle", false)]
    #[case("APPLE", true)]
    #[case("apple", true)]
    #[case("Apple", true)]
    #[case("AppLe", false)]
    #[case("zZZ", false)]
    #[case("HELlo", false)]
    #[case("qwerty", true)]
    #[case("Qwerty", true)]
    #[case("QWERTY", true)]
    #[case("QwErTy", false)]
    #[case("Abcdefg", true)]
    #[case("abcdEfg", false)]
    fn test_detect_capital_use(#[case] word: &str, #[case] expected: bool) {
        assert_eq!(detect_capital_use(word.to_string()), expected);
    }
}
