pub fn common_factors(a: i32, b: i32) -> i32 {
		let max = a.max(b) + 1;
		let mut count: i32 = 0;
		for i in 1..max {
			if a % i == 0 && b % i == 0 {
				count += 1;
			}
		}
    count
}

#[cfg(test)]
mod tests {
    use super::common_factors;
    use rstest::rstest;
    #[rstest]
    #[case(12, 6, 4)]
    #[case(25, 30, 2)]
    #[case(1, 1, 1)]
    #[case(100, 5, 2)]
    #[case(7, 13, 1)]
    #[case(885, 885, 8)]
    #[case(50, 50, 6)]
    #[case(1000, 1000, 16)]
    #[case(997, 1, 1)]
    #[case(997, 991, 1)]
    #[case(17, 51, 2)]
    #[case(500, 250, 8)]
    #[case(1, 1000, 1)]

    fn test_common_factors(#[case] a: i32, #[case] b: i32, #[case] expected: i32) {
        assert_eq!(
            common_factors(a, b),
            expected
        );
    }
}
