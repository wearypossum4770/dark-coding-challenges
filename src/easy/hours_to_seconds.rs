pub fn hours_to_seconds(hours: i32) -> i32 {
    hours * 3_600
}
#[cfg(test)]
mod tests {
    use super::hours_to_seconds;
    #[test]
    fn test_hours_to_seconds() {
        assert_eq!(hours_to_seconds(2), 7200);
        assert_eq!(hours_to_seconds(10), 36000);
        assert_eq!(hours_to_seconds(24), 86400);
        assert_eq!(hours_to_seconds(36), 129600);
    }
}
