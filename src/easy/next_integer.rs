pub fn next_integer(num: i32) -> i32 {
    num + 1
}
#[cfg(test)]
mod tests {
    use super::next_integer;
    #[test]
    fn test_next_integer() {
        assert_eq!(next_integer(2), 3);
        assert_eq!(next_integer(-9), -8);
        assert_eq!(next_integer(0), 1);
        assert_eq!(next_integer(999), 1000);
        assert_eq!(next_integer(73), 74);
    }
}
