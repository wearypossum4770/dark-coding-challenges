pub fn makes_ten(a: i32, b: i32) -> bool {
    if a == 10 || b == 10 {
        return true;
    }
    a + b == 10
}
#[cfg(test)]
mod tests {
    use super::makes_ten;
    #[test]
    fn test_makes_ten() {
        assert_eq!(makes_ten(9, 10), true);
        assert_eq!(makes_ten(9, 9), false);
        assert_eq!(makes_ten(1, 9), true);
        assert_eq!(makes_ten(10, 1), true);
        assert_eq!(makes_ten(10, 10), true);
        assert_eq!(makes_ten(8, 2), true);
        assert_eq!(makes_ten(8, 3), false);
        assert_eq!(makes_ten(10, 42), true);
        assert_eq!(makes_ten(12, -2), true);
    }
}
