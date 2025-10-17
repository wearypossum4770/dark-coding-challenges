pub fn create_hello_world() -> impl Fn() -> &'static str {
    || "Hello World"
}

#[cfg(test)]
mod tests {
    use super::create_hello_world;

    const EXPECTED: &str = "Hello World";

    #[test]
    fn test_no_args() {
        let hello_world = create_hello_world();
        assert_eq!(hello_world(), EXPECTED);
    }

    #[test]
    fn test_multiple_calls() {
        let hello_world = create_hello_world();
        assert_eq!(hello_world(), EXPECTED);
        assert_eq!(hello_world(), EXPECTED);
        assert_eq!(hello_world(), EXPECTED);
    }
}
