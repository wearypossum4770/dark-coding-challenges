pub fn palindrome_number(x: i32) -> bool {
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false;
    }
    let num_string: Vec<u8> = x.to_string().chars().map(|c| c as u8).collect();
    let mut right = num_string.len().saturating_sub(1);
    for num in &num_string {
        if *num != *num_string.get(right).unwrap_or(&(0xff_u8)) {
            return false;
        }
        right = right.saturating_sub(1);
    }
    true
}

#[cfg(test)]
mod tests {
    use super::palindrome_number;
    use rstest::rstest;
    #[rstest]
    #[case(false, -121)]
    #[case(true, 121)]
    #[case(false, 10)]
    #[case(false, -101)]
    #[case(false, -10)]
    #[case(false, -1)]
    #[case(true, 0)]
    #[case(true, 3)]
    #[case(true, 8)]
    #[case(true, 9)]
    #[case(true, 11)]
    fn test_palindrome_numbers(#[case] expected: bool, #[case] num: i32) {
        assert_eq!(expected, palindrome_number(num));
    }
}
