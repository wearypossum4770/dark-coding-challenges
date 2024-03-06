pub fn age_to_days(age: u16) -> u16 {
    age * 365
}
#[cfg(test)]
mod tests {
    use super::age_to_days;
    #[test]
    fn test_age_to_days() {
        assert_eq!(age_to_days(10), 3650);
        assert_eq!(age_to_days(0), 0);
        assert_eq!(age_to_days(73), 26645);
    }
}
