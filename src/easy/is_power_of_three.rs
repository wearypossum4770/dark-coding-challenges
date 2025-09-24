pub fn is_power_of_three(n: i32) -> bool {
    if n < 1 {
        return false;
    }
    let mut num = n;
    while num % 3 == 0 {
        num /= 3;
    }
    num == 1
}

#[cfg(test)]
mod tests {
    use super::is_power_of_three;
    use rstest::rstest;
    #[rstest]
    #[case(1, true)]
    #[case(3, true)]
    #[case(9, true)]
    #[case(27, true)]
    #[case(81, true)]
    #[case(243, true)]
    #[case(2, false)]
    #[case(4, false)]
    #[case(45, false)]
    #[case(6, false)]
    #[case(10, false)]
    #[case(12, false)]
    #[case(100, false)]
    #[case(0, false)]
    #[case(-3, false)]
    #[case(-27, false)]
    #[case(2147483647, false)]
    fn test_is_power_of_three(#[case] n: i32, #[case] expected: bool) {
        assert_eq!(is_power_of_three(n), expected);
    }
}
