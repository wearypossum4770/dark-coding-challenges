pub fn division(dividend: i32, divisor: i32) -> f32 {
    if divisor == 0 {
        return f32::INFINITY;
    }
    dividend as f32 / divisor as f32
}
#[cfg(test)]
mod tests {
    use super::division;
    #[test]
    fn test_division() {
        assert_eq!(division(12, 4), 3.0);
        assert_eq!(division(2, 0), f32::INFINITY);
    }
}
