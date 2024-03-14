pub fn should_serve_drinks(age: u16, on_break: bool) -> bool {
    match age >= 18 {
        true => !on_break,
        false => false,
    }
}
#[cfg(test)]
mod tests {
    use super::should_serve_drinks;
    #[test]
    fn test_should_serve_drinks() {
        assert_eq!(should_serve_drinks(17, true), false);
        assert_eq!(should_serve_drinks(30, true), false);
        assert_eq!(should_serve_drinks(24, false), true);
        assert_eq!(should_serve_drinks(18, false), true);
        assert_eq!(should_serve_drinks(3, false), false);
    }
}
