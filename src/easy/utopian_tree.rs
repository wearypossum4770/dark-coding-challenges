pub fn utopian_tree(cycles: i32) -> i32 {
    (0..=cycles).fold(0, |growth, year| {
        if year % 2 == 0 {
            growth + 1
        } else {
            growth * 2
        }
    })
}
#[cfg(test)]
mod tests {
    use super::utopian_tree;
    #[test]
    fn test_utopian_tree() {
        assert_eq!(utopian_tree(0), 1);
        assert_eq!(utopian_tree(1), 2);
        assert_eq!(utopian_tree(4), 7);
        assert_eq!(utopian_tree(3), 6);
        assert_eq!(utopian_tree(17), 1022);
        assert_eq!(utopian_tree(16), 511);
        assert_eq!(utopian_tree(19), 2046);
        assert_eq!(utopian_tree(20), 2047);
        assert_eq!(utopian_tree(18), 1023);
        assert_eq!(utopian_tree(21), 4094);
        assert_eq!(utopian_tree(27), 32766);
        assert_eq!(utopian_tree(26), 16383);
        assert_eq!(utopian_tree(25), 16382);
        assert_eq!(utopian_tree(22), 4095);
        assert_eq!(utopian_tree(28), 32767);
        assert_eq!(utopian_tree(23), 8190);
        assert_eq!(utopian_tree(24), 8191);
        assert_eq!(utopian_tree(14), 255);
        assert_eq!(utopian_tree(13), 254);
        assert_eq!(utopian_tree(12), 127);
        assert_eq!(utopian_tree(11), 126);
        assert_eq!(utopian_tree(15), 510);
    }
}
