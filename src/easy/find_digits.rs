/// https://www.hackerrank.com/challenges/find-digits/problem
/// Hacker Rank - Find Digits
pub fn find_digits(n: i32) -> i32 {
    let digits: Vec<String> = n.to_string().chars().map(|c| c.to_string()).collect();
    let mut target: i32 = 0;
    for digit in digits.iter() {
        if digit == "0" {
            continue;
        }
        match digit.parse::<i32>() {
            Ok(number) => match n % number == 0 {
                true => target += 1,
                false => continue,
            },
            Err(..) => continue,
        };
    }
    target
}
#[cfg(test)]
mod tests {
    use super::find_digits;
    #[test]
    fn test_find_digits() {
        assert_eq!(find_digits(124), 3);
        assert_eq!(find_digits(111), 3);
        assert_eq!(find_digits(12), 2);
        assert_eq!(find_digits(1012), 3);
        assert_eq!(find_digits(123456789), 3);
        assert_eq!(find_digits(114108089), 3);
        assert_eq!(find_digits(110110015), 6);
        assert_eq!(find_digits(121), 2);
        assert_eq!(find_digits(33), 2);
        assert_eq!(find_digits(44), 2);
        assert_eq!(find_digits(55), 2);
        assert_eq!(find_digits(66), 2);
        assert_eq!(find_digits(77), 2);
        assert_eq!(find_digits(88), 2);
        assert_eq!(find_digits(106108048), 5);
    }
}
