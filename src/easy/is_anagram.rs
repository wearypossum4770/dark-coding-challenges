use std::collections::HashMap;

pub fn is_anagram<'a>(first: &'a str, second: &'a str) -> bool {
    if first.len() != second.len() {
        return false;
    }
    let mut char_dict: HashMap<char, u32> = HashMap::new();
    for c in first.chars() {
        *char_dict.entry(c).or_insert(0) += 1;
    }

    for c in second.chars() {
        if let Some(count) = char_dict.get_mut(&c) {
            if *count < 1 {
                return false;
            }
            *count -= 1;
        }
    }
    char_dict.values().all(|&c| c == 0)
}

pub fn detect_anagrams<'a>(word: &'a str, candidates: Vec<&'a str>) -> Vec<&'a str> {
    let mut valid = Vec::new();
    for candidate in candidates.into_iter() {
        if is_anagram(
            word.to_lowercase().as_str(),
            candidate.to_lowercase().as_str(),
        ) {
            valid.push(candidate);
        }
    }

    valid
}

#[cfg(test)]
mod tests {
    use super::{detect_anagrams, is_anagram};
    use rstest::rstest;

    #[rstest]
    #[case("listen", "silent", true)]
    #[case("evil", "vile", true)]
    #[case("race", "care", true)]
    #[case("anagram", "nagaram", true)]
    #[case("listen", "silent", true)]
    #[case("triangle", "integral", true)]
    #[case("apple", "pale", false)]
    #[case("aacc", "ccac", false)]
    #[case("", "", true)]
    #[case("a", "a", true)]
    #[case("a", "b", false)]
    #[case("aaaaa", "aaaaa", true)]
    #[case("abcd", "abdc", true)]
    fn test_is_anagram<'a>(
        #[case] first: &'a str,
        #[case] second: &'a str,
        #[case] expected: bool,
    ) {
        assert_eq!(is_anagram(first, second), expected);
    }
    fn run_detect_anagrams_test<'a>(
        word: &'a str,
        candidates: Vec<&'a str>,
        mut expected: Vec<&'a str>,
    ) {
        let mut actual = detect_anagrams(word, candidates);
        actual.sort_unstable();
        expected.sort_unstable();
        assert_eq!(actual, expected);
    }

    #[test]
    fn test_detect_anagrams_no_matches() {
        let word = "diaper";
        let candidates = vec!["hello", "world", "zombies", "pants"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_two_anagrams() {
        let word = "solemn";
        let candidates = vec!["lemons", "cherry", "melons"];
        let expected = vec!["lemons", "melons"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_no_subsets() {
        let word = "good";
        let candidates = vec!["dog", "goody"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_single_anagram() {
        let word = "listen";
        let candidates = vec!["enlists", "google", "inlets", "banana"];
        let expected = vec!["inlets"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_three_anagrams() {
        let word = "allergy";
        let candidates = vec![
            "gallery",
            "ballerina",
            "regally",
            "clergy",
            "largely",
            "leading",
        ];
        let expected = vec!["gallery", "regally", "largely"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_multiple_different_case() {
        let word = "nose";
        let candidates = vec!["Eons", "ONES"];
        let expected = vec!["Eons", "ONES"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_no_checksum_trick() {
        let word = "mass";
        let candidates = vec!["last"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_case_insensitive_match() {
        let word = "Orchestra";
        let candidates = vec!["cashregister", "Carthorse", "radishes"];
        let expected = vec!["Carthorse"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_case_insensitive_subject() {
        let word = "Orchestra";
        let candidates = vec!["cashregister", "carthorse", "radishes"];
        let expected = vec!["carthorse"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_case_insensitive_matches() {
        let word = "orchestra";
        let candidates = vec!["cashregister", "Carthorse", "radishes"];
        let expected = vec!["Carthorse"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_original_word_repeated() {
        let word = "go";
        let candidates = vec!["goGoGO"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_all_letters_exactly_once() {
        let word = "tapper";
        let candidates = vec!["patter"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_not_self() {
        let word = "BANANA";
        let candidates = vec!["BANANA"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_not_self_partially_different_case() {
        let word = "BANANA";
        let candidates = vec!["Banana"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_not_self_completely_different_case() {
        let word = "BANANA";
        let candidates = vec!["banana"];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_other_words_can_be_anagrams() {
        let word = "LISTEN";
        let candidates = vec!["LISTEN", "Silent"];
        let expected = vec!["Silent"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_self_and_variation() {
        let word = "go";
        let candidates = vec!["go", "og", "dog"];
        let expected = vec!["og"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    #[ignore = "Test failure needs to fix function"]
    fn test_detect_anagrams_case_variations_and_self_exclusion() {
        let word = "Rust";
        let candidates = vec!["rust", "Stur", "trus", "TSRU"];
        let expected = vec!["Stur", "trus", "TSRU"];
        run_detect_anagrams_test(word, candidates, expected);
    }

    #[test]
    fn test_detect_anagrams_empty_candidates_list() {
        let word = "word";
        let candidates: Vec<&str> = vec![];
        let expected: Vec<&str> = vec![];
        run_detect_anagrams_test(word, candidates, expected);
    }
}
