pub fn compare_string_length(a: &str, b: &str) -> bool {
    a.len() == b.len()
}
#[cfg(test)]
mod tests {
    use super::compare_string_length;
    #[test]
    fn test_compare_string_length() {
        assert_eq!(compare_string_length("AB", "CD"), true);
        assert_eq!(compare_string_length("ABC", "DE"), false);
        assert_eq!(compare_string_length("hello", "edabit"), false);
        assert_eq!(compare_string_length("meow", "woof"), true);
        assert_eq!(compare_string_length("jrnvjrnnt", "cvjknfjvmfvnfjn"), false);
        assert_eq!(compare_string_length("jkvnjrt", "krnf"), false);
        assert_eq!(compare_string_length("Facebook", "Snapchat"), true);
    }
}
