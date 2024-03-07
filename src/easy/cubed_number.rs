pub fn cubed_number(num: i32) -> i32 {
    i32::pow(num, 3)
}
#[cfg(test)]
mod tests {
    use super::cubed_number;
    #[test]
    fn test_cubed_number() {
        assert_eq!(cubed_number(1), 1);
        assert_eq!(cubed_number(2), 8);
        assert_eq!(cubed_number(3), 27);
        assert_eq!(cubed_number(4), 64);
        assert_eq!(cubed_number(5), 125);
        assert_eq!(cubed_number(6), 216);
        assert_eq!(cubed_number(7), 343);
        assert_eq!(cubed_number(8), 512);
        assert_eq!(cubed_number(9), 729);
        assert_eq!(cubed_number(10), 1000);
        assert_eq!(cubed_number(11), 1331);
        assert_eq!(cubed_number(12), 1728);
        assert_eq!(cubed_number(13), 2197);
        assert_eq!(cubed_number(14), 2744);
        assert_eq!(cubed_number(15), 3375);
        assert_eq!(cubed_number(16), 4096);
        assert_eq!(cubed_number(17), 4913);
        assert_eq!(cubed_number(18), 5832);
        assert_eq!(cubed_number(19), 6859);
        assert_eq!(cubed_number(20), 8000);
        assert_eq!(cubed_number(21), 9261);
        assert_eq!(cubed_number(22), 10648);
        assert_eq!(cubed_number(23), 12167);
        assert_eq!(cubed_number(24), 13824);
        assert_eq!(cubed_number(25), 15625);
        assert_eq!(cubed_number(26), 17576);
        assert_eq!(cubed_number(27), 19683);
        assert_eq!(cubed_number(28), 21952);
        assert_eq!(cubed_number(29), 24389);
        assert_eq!(cubed_number(30), 27000);
    }
}
