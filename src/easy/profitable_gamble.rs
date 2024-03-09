pub fn profitable_gamble(probability: f32, prize: u32, cost: f32) -> bool {
    let gamble = probability * prize as f32;
    gamble > cost as f32
}
#[cfg(test)]
mod tests {
    use super::profitable_gamble;
    #[test]
    fn test_profitable_gamble() {
        assert_eq!(profitable_gamble(0.2, 50, 9_f32), true);
        assert_eq!(profitable_gamble(0.9, 1, 2_f32), false);
        assert_eq!(profitable_gamble(0.9, 3, 2_f32), true);
        assert_eq!(profitable_gamble(0.33, 10, 3.30_f32), true);
        assert_eq!(profitable_gamble(0_f32, 1000, 0.01_f32), false);
        assert_eq!(profitable_gamble(0.1, 1000, 7_f32), true);
        assert_eq!(profitable_gamble(0_f32, 0, 0_f32), false);
    }
}
