///@ HackerRank: [Sherlock and the Beast](https://www.hackerrank.com/challenges/sherlock-and-the-beast/problem)
///@
///@ A "Decent Number" has the following properties:
///@ 1. Its digits can only be 3's and/or 5's.
///@ 2. The number of 3's it contains is divisible by 5.
///@ 3. The number of 5's it contains is divisible by 3.
///@ 4. It is the largest such number for its length.
///@
///@ The function accepts an integer `n` as a parameter and returns a string representing
///@ the largest "Decent Number" that can be formed with `n` digits, or "-1" if no such number exists.
///@
///@ # Examples
///@ ```
///@ decent_number(1) == "-1".to_owned()
///@ ```
///@
///@ # Parameters
///@ - `n`: An integer representing the length of the number.
///@
///@ # Return
///@ Returns a string representing the largest decent number, or "-1" if it's not possible.
pub fn decent_number(n: i32) -> String {
    const NOT_FOUND: &str = "-1";

    if n < 3 {
        return NOT_FOUND.to_string();
    };
    let mut fives = n;
    while fives % 3 != 0 {
        fives -= 5;
    }
    if fives >= 0 {
        let threes = n - fives;
        format!(
            "{}{}",
            "5".repeat(fives as usize),
            "3".repeat(threes as usize)
        )
    } else {
        NOT_FOUND.to_string()
    }
}
#[cfg(test)]
mod tests {
    use super::decent_number;

    #[test]
    fn test_is_1_decent_number() {
        assert_eq!(decent_number(1), String::from("-1"));
    }
    #[test]
    fn test_is_2_decent_number() {
        assert_eq!(decent_number(2), String::from("-1"));
    }
    #[test]
    fn test_is_3_decent_number() {
        assert_eq!(decent_number(3), String::from("555"));
    }
    #[test]
    fn test_is_4_decent_number() {
        assert_eq!(decent_number(4), String::from("-1"));
    }
    #[test]
    fn test_is_5_decent_number() {
        assert_eq!(decent_number(5), String::from("33333"));
    }
    #[test]
    fn test_is_6_decent_number() {
        assert_eq!(decent_number(6), String::from("555555"));
    }
    #[test]
    fn test_is_7_decent_number() {
        assert_eq!(decent_number(7), String::from("-1"));
    }
    #[test]
    fn test_is_10_decent_number() {
        assert_eq!(decent_number(10), String::from("3333333333"));
    }
    #[test]
    fn test_is_11_decent_number() {
        assert_eq!(decent_number(11), String::from("55555533333"));
    }
    #[test]
    fn test_is_13_decent_number() {
        assert_eq!(decent_number(13), String::from("5553333333333"));
    }
    #[test]
    fn test_is_14_decent_number() {
        assert_eq!(decent_number(14), String::from("55555555533333"));
    }
    #[test]
    fn test_is_15_decent_number() {
        assert_eq!(decent_number(15), String::from("555555555555555"));
    }
    #[test]
    fn test_is_20_decent_number() {
        assert_eq!(decent_number(20), String::from("55555555555555533333"));
    }
    #[test]
    fn test_is_30_decent_number() {
        assert_eq!(
            decent_number(30),
            String::from("555555555555555555555555555555")
        );
    }
    #[test]
    fn test_is_50_decent_number() {
        assert_eq!(
            decent_number(50),
            String::from("55555555555555555555555555555555555555555555533333")
        );
    }
    #[test]
    fn test_is_1_000_000_decent_number() {
        assert_eq!(
            decent_number(1_000_000),
            format!("{}{}", "5".repeat(999990), "3".repeat(10))
        );
    }
    #[test]
    fn test_is_2194_decent_number() {
        assert_eq!(
            decent_number(2194),
            format!("{}{}", "5".repeat(2184), "3".repeat(10))
        );
    }
    #[test]
    fn test_is_12002_decent_number() {
        assert_eq!(
            decent_number(12002),
            format!("{}{}", "5".repeat(11997), "3".repeat(5))
        );
    }
    #[test]
    fn test_is_21965_decent_number() {
        assert_eq!(
            decent_number(21965),
            format!("{}{}", "5".repeat(21960), "3".repeat(5))
        );
    }
    #[test]
    fn test_is_55140_decent_number() {
        assert_eq!(
            decent_number(55140),
            format!("{}{}", "5".repeat(55140), "3".repeat(0))
        );
    }
    #[test]
    fn test_is_57634_decent_number() {
        assert_eq!(
            decent_number(57634),
            format!("{}{}", "5".repeat(57624), "3".repeat(10))
        );
    }
    #[test]
    fn test_is_72574_decent_number() {
        assert_eq!(
            decent_number(72574),
            format!("{}{}", "5".repeat(72564), "3".repeat(10))
        );
    }
    #[test]
    fn test_is_97624_decent_number() {
        assert_eq!(
            decent_number(97624),
            format!("{}{}", "5".repeat(97614), "3".repeat(10))
        );
    }
    #[test]
    fn test_is_22881_decent_number() {
        assert_eq!(
            decent_number(22881),
            format!("{}{}", "5".repeat(22881), "3".repeat(0))
        );
    }
    #[test]
    fn test_is_52292_decent_number() {
        assert_eq!(
            decent_number(52292),
            format!("{}{}", "5".repeat(52287), "3".repeat(5))
        );
    }
    #[test]
    fn test_is_1650_decent_number() {
        assert_eq!(
            decent_number(1650),
            format!("{}{}", "5".repeat(1650), "3".repeat(0))
        );
    }
}
