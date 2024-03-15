pub fn switch_positions(switches: u32) -> u32 {
    2_u32.pow(switches)
}
#[cfg(test)]
mod tests {
    use super::switch_positions;
    #[test]
    fn test_switch_positions() {
        assert_eq!(switch_positions(5), 32);
        assert_eq!(switch_positions(4), 16);
        assert_eq!(switch_positions(3), 8);
        assert_eq!(switch_positions(2), 4);
        assert_eq!(switch_positions(1), 2);
        assert_eq!(switch_positions(6), 64);
        assert_eq!(switch_positions(7), 128);
        assert_eq!(switch_positions(8), 256);
        assert_eq!(switch_positions(9), 512);
        assert_eq!(switch_positions(10), 1024);
        assert_eq!(switch_positions(25), 33554432);
    }
}
