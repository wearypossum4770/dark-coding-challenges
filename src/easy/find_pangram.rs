const ALPHABETIC: [&str; 26] = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
    "t", "u", "v", "w", "x", "y", "z",
];

pub fn find_pangram(sentence: &str) -> bool {
    for ch in ALPHABETIC {
        if !sentence.contains(ch) && !sentence.contains(&ch.to_uppercase()) {
            return false;
        }
    }
    true
}
#[cfg(test)]
mod tests {
    use super::find_pangram;
    #[test]
    fn test_find_pangram() {
        assert_eq!(find_pangram(""), false);
        assert_eq!(find_pangram(&"abcdefghijklmnopqrstuvwxyz"), true);
        assert_eq!(
            find_pangram(&"the quick brown fox jumps over the lazy dog"),
            true
        );
        assert_eq!(
            find_pangram(&"a quick movement of the enemy will jeopardize five gunboats"),
            false
        );
        assert_eq!(
            find_pangram(&"five boxing wizards jump quickly at it"),
            false
        );
        assert_eq!(
            find_pangram(&"the_quick_brown_fox_jumps_over_the_lazy_dog"),
            true
        );
        assert_eq!(
            find_pangram(&"the 1 quick brown fox jumps over the 2 lazy dogs"),
            true
        );
        assert_eq!(
            find_pangram(&"7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"),
            false
        );
        assert_eq!(
            find_pangram(&"Five quacking Zephyrs jolt my wax bed."),
            true
        );
        assert_eq!(find_pangram(&"abcdefghijklm ABCDEFGHIJKLM"), false);
    }
}
