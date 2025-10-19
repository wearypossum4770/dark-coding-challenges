pub fn difference_of_sums(n: i32, m: i32) -> i32 {
    let mut lhs: i32 = 0;
    let mut rhs: i32 = 0;
    for i in 1..=n {
        if i % m == 0 {
            rhs += i;
        } else {
            lhs += i;
        }
    }
    lhs - rhs
}
#[cfg(test)]
mod tests {
    use super::difference_of_sums;
    use rstest::rstest;
    #[rstest]
    #[case(10, 3, 19)]
    #[case(5, 6, 15)]
    #[case(5, 1, -15)]

    fn test_difference_of_sums(#[case] n: i32, #[case] m: i32, #[case] expected: i32) {
        assert_eq!(difference_of_sums(n, m), expected);
    }
}
