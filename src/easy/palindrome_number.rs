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

    #[test]
    fn test_is_neg_121_a_palindrome() {
        assert_eq!(false, palindrome_number(-121));
    }
    #[test]
    fn test_is_121_a_palindrome() {
        assert_eq!(true, palindrome_number(121));
    }
    #[test]
    fn test_is_10_a_palindrome() {
        assert_eq!(false, palindrome_number(10));
    }
    #[test]
    fn test_is_neg_101_a_palindrome() {
        assert_eq!(false, palindrome_number(-101));
    }
    #[test]
    fn test_is_neg_10_a_palindrome() {
        assert_eq!(false, palindrome_number(-10));
    }
    #[test]
    fn test_is_neg_1_a_palindrome() {
        assert_eq!(false, palindrome_number(-1));
    }
    #[test]
    fn test_is_0_a_palindrome() {
        assert_eq!(true, palindrome_number(0));
    }
    #[test]
    fn test_is_3_a_palindrome() {
        assert_eq!(true, palindrome_number(3));
    }
    #[test]
    fn test_is_8_a_palindrome() {
        assert_eq!(true, palindrome_number(8));
    }
    #[test]
    fn test_is_9_a_palindrome() {
        assert_eq!(true, palindrome_number(9));
    }
    #[test]
    fn test_is_11_a_palindrome() {
        assert_eq!(true, palindrome_number(11));
    }
}
