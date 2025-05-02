use std::collections::HashSet;

pub fn is_pangram(text: &str) -> bool {
    let characters: HashSet<char> = text
        .to_lowercase()
        .chars()
        .filter(|letter| letter.is_ascii_alphabetic())
        .collect::<HashSet<char>>();
    characters.len() == 26
}
#[cfg(test)]
mod tests {
    use super::is_pangram;
    use rstest::rstest;
    #[rstest]
    #[case("empty sentence", false, "")]
    #[case("perfect lower case", true, "abcdefghijklmnopqrstuvwxyz")]
    #[case("only lower case", true, "the quick brown fox jumps over the lazy dog")]
    #[case(
        "missing the letter 'x'",
        false,
        "a quick movement of the enemy will jeopardize five gunboats"
    )]
    #[case(
        "missing the letter 'h'",
        false,
        "five boxing wizards jump quickly at it"
    )]
    #[case(
        "with underscores",
        true,
        "the_quick_brown_fox_jumps_over_the_lazy_dog"
    )]
    #[case(
        "with numbers",
        true,
        "the 1 quick brown fox jumps over the 2 lazy dogs"
    )]
    #[case(
        "missing letters replaced by numbers",
        false,
        "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
    )]
    #[case(
        "mixed case and punctuation",
        true,
        "\"Five quacking Zephyrs jolt my wax bed.\""
    )]
    #[case(
        "a-m and A-M are 26 different characters but not a pangram",
        false,
        "abcdefghijklm ABCDEFGHIJKLM"
    )]
    #[case(
        "non-alphanumeric printable ASCII",
        false,
        " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
    )]
    fn test_is_pangram(#[case] criteria: &str, #[case] expected: bool, #[case] input: &str) {
        println!("\tGiven {:?}\n", criteria);
        assert_eq!(is_pangram(input), expected);
    }
}
