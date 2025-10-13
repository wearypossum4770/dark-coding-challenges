
pub fn string_integer_is_balanced(num: String) -> bool {
    let mut even: u32 = 0;
    let mut odd: u32 = 0;
    for (i, n) in num.chars().enumerate() {
        let value = n.to_digit(10).unwrap_or(0);
        if i % 2 == 0 {
            even += value;
        } else {
            odd += value
        }
    }

    even == odd
}
#[cfg(test)]
mod tests {
    use super::string_integer_is_balanced;
    use rstest::rstest;
    #[rstest]
    #[case("12", false)]
    #[case("11", true)]
    #[case("1234", false)]
    #[case("24123", true)]
    #[case("00", true)]
    #[case("10", false)]
    #[case("1010", false)]
    #[case("909", false)]
    #[case("1234567890", false)]
    #[case("111111", true)]
    #[case("123321", true)]
    #[case("99999999", true)]
    #[case("5005", true)]
    #[case("1234567", false)]
    #[case("1", false)]
    fn test_string_integer_is_balanced(#[case] num: &str, #[case] expected: bool) {
        assert_eq!(string_integer_is_balanced(num.to_string()), expected);
    }
}
