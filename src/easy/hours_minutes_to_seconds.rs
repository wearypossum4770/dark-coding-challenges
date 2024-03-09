pub fn hours_minutes_to_seconds(hours: i32, minutes: i32) -> i32 {
    3_600 * hours + 60 * minutes
}
#[cfg(test)]
mod tests {
    use super::hours_minutes_to_seconds;
    #[test]
    fn test_hours_minutes_to_seconds() {
        assert_eq!(hours_minutes_to_seconds(1, 0), 3_600);
        assert_eq!(hours_minutes_to_seconds(1, 3), 3_780);
        assert_eq!(hours_minutes_to_seconds(0, 30), 1_800);
    }
}
