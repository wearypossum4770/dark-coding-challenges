pub fn remainder(a: i32, b: i32) -> i32 {
    a % b
}
pub fn divisible_by_five(a: i32) -> bool {
    a % 5 == 0
}
pub fn divisible_by_100(a: i32, helper: Option<&str>) -> bool {
    println!("{:?}", helper);
    a % 100 == 0
}
#[cfg(test)]
mod tests {
    use super::{divisible_by_100, divisible_by_five, remainder};
    #[test]
    fn test_remainder() {
        assert_eq!(remainder(7, 2), 1);
        assert_eq!(remainder(3, 4), 3);
        assert_eq!(remainder(5, 5), 0);
        assert_eq!(remainder(1, 3), 1);
    }
    #[test]
    fn test_divisible_by_five() {
        assert_eq!(divisible_by_five(7), false);
        assert_eq!(divisible_by_five(5), true);
        assert_eq!(divisible_by_five(15), true);
        assert_eq!(divisible_by_five(33), false);
        assert_eq!(divisible_by_five(-18), false);
        assert_eq!(divisible_by_five(999), false);
        assert_eq!(divisible_by_five(2), false);
    }
    #[test]
    fn test_divisible_by_100() {
        assert_eq!(divisible_by_100(1, None), false);
        assert_eq!(divisible_by_100(100, None), true);
        assert_eq!(divisible_by_100(1000, None), true);
        assert_eq!(divisible_by_100(111000, None), true);
        assert_eq!(divisible_by_100(-1, Some("Don't forget negatives.")), false,);
        assert_eq!(divisible_by_100(0, Some("Cover the 0 cases.")), true,);
        assert_eq!(
            divisible_by_100(-100, Some("-100 is divisible by 100.")),
            true,
        );
    }
}
