pub fn smallest_even_multiple(n: i32) -> i32 {
	if n % 2 != 0 {
		return n * 2;
	}
	n
}
#[cfg(test)]
mod tests {
use super::smallest_even_multiple;
use rstest::rstest;
#[rstest]
	#[case(1, 2)]
    #[case(2, 2)]
    #[case(3, 6)]
    #[case(4, 4)]
    #[case(5, 10)]
    #[case(6, 6)]
    #[case(7, 14)]
    #[case(8, 8)]
    #[case(9, 18)]
    #[case(10, 10)]
    #[case(11, 22)]
    #[case(12, 12)]
    #[case(13, 26)]
    #[case(14, 14)]
    #[case(15, 30)]
    #[case(16, 16)]
    #[case(17, 34)]
    #[case(18, 18)]
    #[case(19, 38)]
    #[case(20, 20)]
    #[case(149, 298)]
    #[case(150, 150)]
    #[case(1, 2)]      
    #[case(2, 2)]      
    #[case(150, 150)]  
    #[case(149, 298)]  
fn test_smallest_even_multiple(#[case] n: i32, #[case] expected: i32) {
assert_eq!(smallest_even_multiple(n), expected);
}
}