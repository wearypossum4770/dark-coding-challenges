pub fn palindromic_number(num: i32) -> bool {
    if num < 0 {
        return false;
    }
    let mut target: Vec<_> = num.to_string().chars().collect::<Vec<_>>();
    target.reverse();
    target.iter().collect::<String>() == num.to_string()
}
#[cfg(test)]
mod tests {
    use super::palindromic_number;
    #[test]
    fn test_palindromic_number() {
        assert_eq!(palindromic_number(121), true);
        assert_eq!(palindromic_number(-121), false);
        assert_eq!(palindromic_number(10), false);
    }
}
