pub fn football_points(wins: u32, draws: u32, losses: u32) -> u32 {
    3 * wins + draws + 0 * losses
}
#[cfg(test)]
mod tests {
    use super::football_points;
    #[test]
    fn test_football_points() {
        assert_eq!(football_points(1, 2, 3), 5);
        assert_eq!(football_points(5, 5, 5), 20);
        assert_eq!(football_points(1, 0, 0), 3);
        assert_eq!(football_points(0, 7, 0), 7);
        assert_eq!(football_points(0, 0, 15), 0);
    }
}
