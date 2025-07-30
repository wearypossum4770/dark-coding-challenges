use std::collections::HashMap;

pub fn find_the_difference(s: &str, t: &str) -> char {
    let mut counts = HashMap::new();
    for c in s.chars() {
        *counts.entry(c).or_insert(0) += 1;
    }
    for c in t.chars() {
        let count = counts.entry(c).or_insert(0);
        if *count == 0 {
            return c;
        } else {
            *count -= 1;
        }
    }
    return ' ';
}
#[cfg(test)]
mod tests {
    use super::find_the_difference;
    use rstest::rstest;
    #[rstest]
    #[case("abcd", "abcde", 'e')]
    #[case("", "y", 'y')]
    #[case("a", "aa", 'a')]
    #[case("aabbcc", "aabbccd", 'd')]
    fn test_find_the_difference(#[case] s: &str, #[case] t: &str, #[case] expected: char) {
        assert_eq!(find_the_difference(s, t), expected);
    }
}
