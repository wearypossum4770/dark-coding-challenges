pub fn reverse_vowels(s: String) -> String {
    let vowels: Vec<char> = vec!['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
    let mut chars: Vec<char> = s.chars().collect();
    let mut left = 0;
    let mut right = s.len() - 1;

    while left < right {
        if vowels.contains(&chars[left]) {
            if vowels.contains(&chars[right]) {
                (chars[left], chars[right]) = (chars[right], chars[left]);
                left += 1;
                right -= 1;
            } else {
                right -= 1;
            }
        } else {
            left += 1;
        }
    }
    chars.into_iter().collect()
}
#[cfg(test)]
mod tests {
    use super::reverse_vowels;
    use rstest::rstest;
    #[rstest]
    #[case("IceCreAm", "AceCreIm")]
    #[case("leetcode", "leotcede")]
    #[case("a", "a")]
    #[case("b", "b")]
    #[case("AEIOU", "UOIEA")]
    #[case("aeiou", "uoiea")]
    #[case("bcdfgh", "bcdfgh")]
    #[case("aA", "Aa")]
    #[case("a.b,e", "e.b,a")]
    #[case("hello world", "hollo werld")]
    #[case("aEiOu", "uOiEa")]
    #[case(".,?!", ".,?!")]
    #[case("aaaaaa", "aaaaaa")]
    #[case("aAaaAa", "aAaaAa")]
    fn test_reverse_vowels(#[case] s: &str, #[case] expected: &str) {
        assert_eq!(reverse_vowels(s.to_string()), expected.to_string());
    }
}
