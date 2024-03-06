pub fn remainder(a: i32, b: i32) -> i32 {
    a % b
}
#[cfg(test)]
mod tests {
    use super::remainder;
    #[test]
    fn test_remainder() {
        assert_eq!(remainder(7, 2), 1);
        assert_eq!(remainder(3, 4), 3);
        assert_eq!(remainder(-9, 45), -9);
        assert_eq!(remainder(5, 5), 0);
    }
}
