pub fn less_than100(a: i32, b: i32) -> bool {
    a + b < 100
}
#[cfg(test)]
mod tests {
    use super::less_than100;
    #[test]
    fn test_less_than100() {
        assert_eq!(less_than100(5, 57), true);
        assert_eq!(less_than100(77, 30), false);
        assert_eq!(less_than100(0, 59), true);
        assert_eq!(less_than100(78, 35), false);
        assert_eq!(less_than100(63, 11), true);
        assert_eq!(less_than100(37, 99), false);
        assert_eq!(less_than100(52, 11), true);
        assert_eq!(less_than100(82, 95), false);
        assert_eq!(less_than100(17, 44), true);
        assert_eq!(less_than100(74, 53), false);
        assert_eq!(less_than100(3, 77), true);
        assert_eq!(less_than100(25, 80), false);
        assert_eq!(less_than100(59, 28), true);
        assert_eq!(less_than100(69, 87), false);
        assert_eq!(less_than100(10, 45), true);
        assert_eq!(less_than100(43, 58), false);
        assert_eq!(less_than100(50, 44), true);
        assert_eq!(less_than100(74, 89), false);
        assert_eq!(less_than100(3, 27), true);
        assert_eq!(less_than100(21, 79), false);
    }
}
