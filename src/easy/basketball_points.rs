pub fn basketball_points(two_points: i32, three_points: i32) -> i32 {
    2 * two_points + 3 * three_points
}
#[cfg(test)]
mod tests {
    use super::basketball_points;
    #[test]
    fn test_basketball_points() {
        assert_eq!(basketball_points(1, 1), 5);
        assert_eq!(basketball_points(1, 2), 8);
        assert_eq!(basketball_points(2, 1), 7);
        assert_eq!(basketball_points(2, 2), 10);
        assert_eq!(basketball_points(69, 420), 1398);
    }
}
