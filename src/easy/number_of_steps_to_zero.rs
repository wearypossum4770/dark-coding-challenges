pub fn number_of_steps_to_zero(num: i32) -> i32 {
    if num < 0 {
        return 0;
    }
    let mut n = num;
    let mut steps = 0;
    while n > 0 {
        if n % 2 == 0 {
            n /= 2;
        } else {
            n -= 1;
        }
        steps += 1;
    }
    steps
}
#[cfg(test)]
mod tests {
    use super::number_of_steps_to_zero;
    use rstest::rstest;
    #[rstest]
    #[case(2, 2)]
    #[case(0, 0)]
    #[case(1, 1)]
    #[case(8, 4)]
    #[case(14, 6)]
    #[case(123, 12)]
    #[case(1_000_000, 26)]
    #[case(-1, 0)]
    #[case(999_999, 31)]
    fn test_number_of_steps_to_zero(#[case] n: i32, #[case] expected: i32) {
        assert_eq!(number_of_steps_to_zero(n), expected);
    }
}
