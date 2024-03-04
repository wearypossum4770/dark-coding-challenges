use std::collections::HashSet;

pub fn anagram_string(word: &str) -> String {
    let mut lowercased: Vec<_> = word.to_lowercase().chars().collect();
    lowercased.sort();
    lowercased.into_iter().collect()
}
pub fn find_anagram<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let lowercased: String = word.to_lowercase();
    let sorted: String = anagram_string(&lowercased);
    let mut target: HashSet<&str> = HashSet::with_capacity(possible_anagrams.len());
    for candidate in possible_anagrams {
        if lowercased == candidate.to_lowercase() {
            continue;
        }
        if sorted == anagram_string(candidate) {
            target.insert(*candidate);
        }
    }
    target
}
#[cfg(test)]
mod tests {
    use super::{find_anagram, HashSet};
    #[test]
    fn test_find_anagram() {
        // 'no_matches'
        assert_eq!(
            find_anagram("diaper", &["hello", "world", "zombies", "pants"]),
            HashSet::from_iter([])
        );
        // 'detects_two_anagrams'
        assert_eq!(
            find_anagram("solemn", &["lemons", "cherry", "melons"]),
            HashSet::from_iter(["lemons", "melons"])
        );
        // 'does_not_detect_anagram_subsets'
        assert_eq!(
            find_anagram("good", &["dog", "goody"]),
            HashSet::from_iter([])
        );
        // 'detects_anagram'
        assert_eq!(
            find_anagram("listen", &["enlists", "google", "inlets", "banana"]),
            HashSet::from_iter(["inlets"])
        );
        // 'detects_three_anagrams'
        assert_eq!(
            find_anagram(
                "allergy",
                &[
                    "gallery",
                    "ballerina",
                    "regally",
                    "clergy",
                    "largely",
                    "leading",
                ]
            ),
            HashSet::from_iter(["gallery", "regally", "largely"])
        );
        // 'detects_multiple_anagrams_with_different_case'
        assert_eq!(
            find_anagram("nose", &["Eons", "ONES"]),
            HashSet::from_iter(["Eons", "ONES"])
        );
        // 'does_not_detect_non_anagrams_with_identical_checksum'
        assert_eq!(find_anagram("mass", &["last"]), HashSet::from_iter([]));
        // 'detects_anagrams_case_insensitively'
        assert_eq!(
            find_anagram("Orchestra", &["cashregister", "Carthorse", "radishes"]),
            HashSet::from_iter(["Carthorse"])
        );
        // 'detects_anagrams_using_case_insensitive_subject'
        assert_eq!(
            find_anagram("Orchestra", &["cashregister", "carthorse", "radishes"]),
            HashSet::from_iter(["carthorse"])
        );
        // 'detects_anagrams_using_case_insensitive_possible_matches'
        assert_eq!(
            find_anagram("orchestra", &["cashregister", "Carthorse", "radishes"]),
            HashSet::from_iter(["Carthorse"])
        );
        // 'does_not_detect_an_anagram_if_the_original_word_is_repeated'
        assert_eq!(find_anagram("go", &["goGoGO"]), HashSet::from_iter([]));
        // 'anagrams_must_use_all_letters_exactly_once'
        assert_eq!(find_anagram("tapper", &["patter"]), HashSet::from_iter([]));
        // 'words_are_not_anagrams_of_themselves'
        assert_eq!(find_anagram("BANANA", &["BANANA"]), HashSet::from_iter([]));
        // 'words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different'
        assert_eq!(find_anagram("BANANA", &["Banana"]), HashSet::from_iter([]));
        // 'words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different'
        assert_eq!(find_anagram("BANANA", &["banana"]), HashSet::from_iter([]));
        // 'words_other_than_themselves_can_be_anagrams'
        assert_eq!(
            find_anagram("LISTEN", &["LISTEN", "Silent"]),
            HashSet::from_iter(["Silent"])
        );
        // 'handles_case_of_greek_letters'
        assert_eq!(
            find_anagram("ΑΒΓ", &["ΒΓΑ", "ΒΓΔ", "γβα", "αβγ"]),
            HashSet::from_iter(["ΒΓΑ", "γβα"])
        );
        // 'different_characters_may_have_the_same_bytes'
        assert_eq!(find_anagram("a⬂", &["€a"]), HashSet::from_iter([]));
    }
}
