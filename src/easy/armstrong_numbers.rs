pub fn armstrong_numbers(num: i32) -> u8 {
    if num < 0 {
        return 0;
    };
    let digits = num.to_string();
    let power: u32 = digits.len().try_into().unwrap_or(1);
    let sum = digits
        .chars()
        .fold(0, |acc, x| acc + x.to_digit(10).unwrap_or(0).pow(power));
    match sum == num.try_into().unwrap() {
        true => 1,
        false => 0,
    }
}

#[cfg(test)]
mod tests {
    use super::armstrong_numbers;
    use rstest::rstest;
    #[rstest]
    #[case(2, 1)]
    #[case(89, 0)]
    #[case(0, 1)]
    #[case(39, 0)]
    #[case(555, 0)]
    #[case(9475, 0)]
    #[case(9926315, 1)]
    #[case(93084, 1)]
    #[case(548834, 1)]
    #[case(2147483647, 0)]
    #[case(365, 0)]
    #[case(120, 0)]
    #[case(1253, 0)]
    #[case(153, 1)]
    #[case(-153, 0)]
    #[case(407, 1)]
    #[case(370, 1)]
    #[case(371, 1)]
    #[case(1634, 1)]
    #[case(8208, 1)]
    #[case(9474, 1)]
    fn test_armstrong_numbers(#[case] num: i32, #[case] expected: u8) {
        assert_eq!(expected, armstrong_numbers(num));
    }
}
