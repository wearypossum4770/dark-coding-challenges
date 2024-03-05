pub fn longest_common_prefix(strs: Vec<String>) -> String {
    let max_length = strs.iter().map(|x| x.len()).max().unwrap_or(0);
    let first: Vec<_> = strs[0].chars().map(|s| s.to_owned()).collect();
    let mut target: String = String::with_capacity(max_length);
    for outer in strs.iter() {
        for inner in outer.chars() {
            println!("{:?}", target.capacity());
        }
    }
    target
}
#[cfg(test)]
mod tests {
    use super::longest_common_prefix;
    #[test]
    fn test_longest_common_prefix() {
        assert_eq!(
            longest_common_prefix(vec!(
                "flower".to_owned(),
                "flow".to_owned(),
                "flight".to_owned()
            )),
            "fl".to_owned()
        );
        assert_eq!(longest_common_prefix(vec!("".to_owned(), "b".to_owned())), "".to_owned());
        assert_eq!(longest_common_prefix(vec!("a".to_owned())), "a".to_owned());
        assert_eq!(
            longest_common_prefix(vec!(
                "dog".to_owned(),
                "racecar".to_owned(),
                "car".to_owned()
            )),
            "".to_owned()
        );
    }
}
