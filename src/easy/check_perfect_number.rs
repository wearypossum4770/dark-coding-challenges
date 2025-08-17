pub fn check_perfect_number(n: u64) -> bool {
    n == calculate_perfect_number(n)
}
pub fn classify_perfect_number(n: u64) -> String {
    let num = calculate_perfect_number(n);
    if n < num {
        return "abundant".to_string();
    }
    if n > num {
        return "deficient".to_string();
    }
    "perfect".to_string()
}
pub fn calculate_perfect_number(n: u64) -> u64 {
    if n <= 0 {
        panic!("Perfect numbers must be greater than 1");
    }
    if n == 1 {
        return 1;
    }
    let mut total: u64 = 1;
    for i in 2..=n.isqrt() {
        if n % i == 0 {
            total += i;
            let other = n / i;
            if other != i {
                total += other;
            }
        }
    }
    total
}
#[cfg(test)]
mod tests {
    use super::{calculate_perfect_number, check_perfect_number, classify_perfect_number};
    use rstest::rstest;

    #[rstest]
    #[case("Perfect number 496", 496, true)]
    #[case("Perfect number 8_128", 8128, true)]
    #[case("Perfect number 8_589_869_056", 8589869056, true)]
    #[case("Perfect number 137_438_691_328", 137438691328, true)]
    #[case("Smallest perfect number", 6, true)]
    #[case("Medium perfect number", 28, true)]
    #[case("Large perfect number", 33550336, true)]
    #[case("Smallest abundant number", 12, false)]
    #[case("Medium abundant number", 30, false)]
    #[case("Large abundant number", 33550335, false)]
    #[case("Smallest prime deficient number", 2, false)]
    #[case("Smallest non-prime deficient number", 4, false)]
    #[case("Medium deficient number", 32, false)]
    #[case("Large deficient number", 33550337, false)]
    fn test_check_perfect_number(#[case] criteria: &str, #[case] n: u64, #[case] expected: bool) {
        println!("{:?}\n", criteria);
        assert_eq!(check_perfect_number(n), expected)
    }

    #[rstest]
    #[case(496, 496)]
    #[case(8128, 8128)]
    #[case(8589869056, 8589869056)]
    #[case(137438691328, 137438691328)]
    #[case(6, 6)]
    #[case(28, 28)]
    #[case(33550336, 33550336)]
    #[case(12, 16)]
    #[case(30, 42)]
    #[case(33550335, 39885825)]
    #[case(2, 1)]
    #[case(4, 3)]
    #[case(32, 31)]
    #[case(33550337, 1)]

    fn test_calculate_perfect_number(#[case] n: u64, #[case] result: u64) {
        assert_eq!(calculate_perfect_number(n), result);
    }

    #[rstest]
    #[case("perfect", 496)]
    #[case("perfect", 8128)]
    #[case("perfect", 8589869056)]
    #[case("perfect", 137438691328)]
    #[case("perfect", 6)]
    #[case("perfect", 28)]
    #[case("perfect", 33550336)]
    #[case("abundant", 12)]
    #[case("abundant", 30)]
    #[case("abundant", 33550335)]
    #[case("deficient", 2)]
    #[case("deficient", 4)]
    #[case("deficient", 32)]
    #[case("deficient", 33550337)]
    fn test_classify_perfect_number(#[case] classify: &str, #[case] n: u64) {
        assert_eq!(classify_perfect_number(n), classify)
    }
}
