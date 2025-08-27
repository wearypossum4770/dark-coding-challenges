pub fn reverse_integer(x: i32) -> i32 {
    let mut num: i64 = 0;
    let mut shadow: i64 = x as i64;
    while shadow != 0 {
        num = num * 10 + shadow % 10;
        shadow = shadow.saturating_div(10);
    }
    if num > i32::MAX as i64 || num < i32::MIN as i64 {
        return 0;
    }
    num as i32
}
#[cfg(test)]
mod tests {
    use super::reverse_integer;
    use rstest::rstest;
    #[rstest]
    #[case(123, 321)]
    #[case(-123, -321)]
    #[case(120, 21)]
    fn test_reverse_integer(#[case] num: i32, #[case] expected: i32) {
        assert_eq!(reverse_integer(num), expected);
    }
}
