pub fn give_me_something(word: &str) -> String {
    format!("something {}", word)
}
#[cfg(test)]
mod tests {
    use super::give_me_something;
    #[test]
    fn test_give_me_something() {
        assert_eq!(give_me_something("a"), "something a".to_string());
        assert_eq!(
            give_me_something("is cooking"),
            "something is cooking".to_string()
        );
        assert_eq!(
            give_me_something(" is cooking"),
            "something  is cooking".to_string()
        );
    }
}
