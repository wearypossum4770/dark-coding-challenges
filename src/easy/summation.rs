pub fn summation(a: i32, b: i32) -> i32 {
    a + b
}
#[cfg(test)]
mod tests {
    use super::summation;
    #[test]
    fn test_summation() {
        assert_eq!(summation(2, 3), 5);
        assert_eq!(summation(1, 3), 4);
        assert_eq!(summation(3, 4), 7);
    }
}
