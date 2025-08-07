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
        if is_anagram(word.to_lowercase().as_str(), candidate.to_lowercase().as_str()) {
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
   fn run_detect_anagrams_test<'a>(word: &'a str, candidates: Vec<&'a str>, mut expected: Vec<&'a str>) {
        let mut actual = detect_anagrams(word, candidates);
        actual.sort_unstable(); // Sort to make comparison order-independent
        expected.sort_unstable();
        assert_eq!(actual, expected);
    }
}
