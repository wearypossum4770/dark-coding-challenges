pub fn minutes_to_seconds(minutes: i32) -> i32 {
    minutes * 60
}
#[cfg(test)]
mod tests {
    use super::minutes_to_seconds;
    #[test]
    fn test_minutes_to_seconds() {
        assert_eq!(minutes_to_seconds(6), 360);
        assert_eq!(minutes_to_seconds(4), 240);
        assert_eq!(minutes_to_seconds(8), 480);
        assert_eq!(minutes_to_seconds(60), 3600);
    }
}
