pub fn integer_subtraction(minuend: i32, subtrahend: i32) -> i32 {
    minuend - subtrahend
}
pub fn float_subtraction(minuend: f32, subtrahend: f32) -> f32 {
    minuend - subtrahend
}
#[cfg(test)]
mod tests {
    use super::integer_subtraction;
    #[test]
    fn test_integer_subtraction() {
        assert_eq!(integer_subtraction(945, 422), 523);
    }
}
