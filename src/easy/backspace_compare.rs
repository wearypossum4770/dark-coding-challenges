pub fn backspace_compare(s: String, t: String) -> bool {
    fn process(text: String) -> String {
        let mut stack = Vec::new();
        for c in text.chars() {
            if c == '#' {
                stack.pop();
            } else {
                stack.push(c);
            }
        }
        stack.iter().collect()
    }
    process(s) == process(t)
}
#[cfg(test)]
mod tests {
    use super::backspace_compare;
    use rstest::rstest;
    #[rstest]
    #[case("y#fo##f", "y#f#o##f", true)]
    #[case("ab#c", "ad#c", true)]
    #[case("ab##", "c#d#", true)]
    #[case("a#c", "b", false)]
    #[case("a", "a", true)]
    #[case("a", "b", false)]
    #[case("#", "#", true)]
    #[case("#a", "a", true)]
    #[case("a#", "", true)]
    #[case("a#", "#", true)]
    #[case("##", "#", true)]
    #[case("###", "##", true)]
    #[case("a##", "#", true)]
    #[case("a##", "", true)]
    #[case("a#b", "b", true)]
    #[case("a#b", "a", false)]
    #[case("abc", "abc", true)]
    #[case("abc", "abd", false)]
    #[case("ab#c", "ab#c", true)]
    #[case("ab##c", "c", true)]
    #[case("a#b#c#", "", true)]
    #[case("a#b#c#d", "d", true)]
    #[case("a#b#c#d", "e", false)]
    #[case("#a#b#", "", true)]
    #[case("bxj##tw", "bxj##tw", true)]
    #[case("bxj##tw", "bxk##tw", true)]
    #[case("xywrrmp", "xywrrmu", false)]
    #[case("xywrrmp", "xywrrmp", true)]
    #[case("a###b", "b", true)]
    #[case("a###b", "a", false)]
    #[case("####", "", true)]
    #[case("####", "####", true)]
    #[case("a####", "#", true)]
    #[case("ab####", "##", true)]
    #[case("nzp#o#g", "b#nzp#o#g", true)]
    #[case("bbbextm", "bbb#extm", false)]
    #[case("ab#c#", "a", true)]
    #[case("a#a#a#", "", true)]
    #[case("abc##", "a", true)]
    #[case("abc###", "", true)]
    #[case("", "#", true)]
    #[case("#", "", true)]
    fn test_backspace_compare(#[case] s: &str, #[case] t: &str, #[case] expected: bool) {
        assert_eq!(backspace_compare(s.to_string(), t.to_string()), expected);
    }
}
