pub fn integer_to_fizz_buzz(n: u32) -> String {
    if n % 15 == 0 {
        return "FizzBuzz".to_string();
    }
    if n % 5 == 0 {
        return "Buzz".to_string();
    }
    if n % 3 == 0 {
        return "Fizz".to_string();
    }
    n.to_string()
}
pub fn fizz_buzz(n: i32) -> Vec<String> {
    let candidate: usize = n.try_into().unwrap();
    let mut target = Vec::with_capacity(candidate);
    for i in 1..=candidate {
        target.push(integer_to_fizz_buzz(i.try_into().unwrap()));
    }
    target
}

#[cfg(test)]
mod tests {
    use super::{fizz_buzz, integer_to_fizz_buzz};
    use rstest::rstest;

    #[rstest]
    #[case(2, "2".to_string())]
    #[case(3, "Fizz".to_string())]
    #[case(5, "Buzz".to_string())]
    #[case(9, "Fizz".to_string())]
    #[case(15, "FizzBuzz".to_string())]
    #[case(27, "Fizz".to_string())]
    #[case(28, "28".to_string())]
    #[case(30, "FizzBuzz".to_string())]
    #[case(10, "Buzz".to_string())]
    #[case(98, "98".to_string())]
    #[case(1, "1" .to_string())]
    #[case(4, "4" .to_string())]
    #[case(16, "16" .to_string())]
    fn test_fizz_buzz_representation(#[case] input: i32, #[case] expected: String) {
        assert_eq!(expected, integer_to_fizz_buzz(input.try_into().unwrap()));
    }
    #[test]
    fn test_fizz_buzz_1() {
        assert_eq!(fizz_buzz(1), vec!["1".to_string()]);
    }
    #[test]
    fn test_fizz_buzz_5() {
        let result: Vec<String> = Vec::from(["1", "2", "Fizz", "4", "Buzz"])
            .into_iter()
            .map(|x| x.to_string())
            .collect();
        assert_eq!(fizz_buzz(5), result);
    }
    #[test]
    fn test_fizz_buzz_3() {
        let result: Vec<String> = Vec::from(["1", "2", "Fizz"])
            .into_iter()
            .map(|x| x.to_string())
            .collect();
        assert_eq!(fizz_buzz(3), result);
    }
    #[test]
    fn test_fizz_buzz_16() {
        let result: Vec<String> = Vec::from([
            "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13",
            "14", "FizzBuzz", "16",
        ])
        .into_iter()
        .map(|x| x.to_string())
        .collect();
        assert_eq!(fizz_buzz(16), result);
    }
    #[test]
    fn test_fizz_buzz_15() {
        let result: Vec<String> = Vec::from([
            "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13",
            "14", "FizzBuzz",
        ])
        .into_iter()
        .map(|x| x.to_string())
        .collect();
        assert_eq!(fizz_buzz(15), result);
    }
    #[test]
    fn test_fizz_buzz_35() {
        let result: Vec<String> = Vec::from([
            "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13",
            "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz",
            "26", "Fizz", "28", "29", "FizzBuzz", "31", "32", "Fizz", "34", "Buzz",
        ])
        .into_iter()
        .map(|x| x.to_string())
        .collect();
        assert_eq!(fizz_buzz(35), result);
    }
}
