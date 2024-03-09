pub fn hello_love(name: &str) -> String {
    match name == "Mubashir" {
        true => "Hello, my Love!".to_owned(),
        false => format!("Hello, {name}!"),
    }
}
#[cfg(test)]
mod tests {
    use super::hello_love;
    #[test]
    fn test_hello_love() {
        assert_eq!(hello_love("Matt"), "Hello, Matt!".to_owned());
        assert_eq!(hello_love("Helen"), "Hello, Helen!".to_owned());
        assert_eq!(hello_love("Mubashir"), "Hello, my Love!".to_owned());
    }
}
