pub fn remainder(numerator: i32, denominator: i32) -> i32 {
    numerator % denominator
}
pub fn divisible_by_five(numerator: i32) -> bool {
    divides_evenly(numerator, 5)
}
pub fn divisible_by_100(numerator: i32, helper: Option<&str>) -> bool {
    println!("{:?}", helper);
    divides_evenly(numerator, 1)
}
pub fn divides_evenly(numerator: i32, denominator: i32) -> bool {
    return remainder(numerator, denominator) == 0;
}
#[cfg(test)]
mod tests {
    use super::{divides_evenly, divisible_by_100, divisible_by_five, remainder};
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
    #[test]
    fn test_divisible_by() {
        assert_eq!(divides_evenly(98, 7), true);
        assert_eq!(divides_evenly(87, 49), false);
        assert_eq!(divides_evenly(34, 14), false);
        assert_eq!(divides_evenly(78, 6), true);
        assert_eq!(divides_evenly(30, 4), false);
        assert_eq!(divides_evenly(87, 73), false);
        assert_eq!(divides_evenly(74, 7), false);
        assert_eq!(divides_evenly(87, 29), true);
        assert_eq!(divides_evenly(48, 24), true);
        assert_eq!(divides_evenly(99, 20), false);
        assert_eq!(divides_evenly(98, 49), true);
        assert_eq!(divides_evenly(100, 6), false);
        assert_eq!(divides_evenly(64, 4), true);
        assert_eq!(divides_evenly(70, 35), true);
        assert_eq!(divides_evenly(38, 38), true);
        assert_eq!(divides_evenly(29, 3), false);
        assert_eq!(divides_evenly(20, 8), false);
        assert_eq!(divides_evenly(66, 50), false);
        assert_eq!(divides_evenly(95, 1), true);
        assert_eq!(divides_evenly(58, 2), true);
    }
    #[test]
    fn test_divisible() {
        assert_eq!(divides_evenly(98, 7), true);
        assert_eq!(divides_evenly(87, 49), false);
        assert_eq!(divides_evenly(34, 14), false);
        assert_eq!(divides_evenly(78, 6), true);
        assert_eq!(divides_evenly(30, 4), false);
        assert_eq!(divides_evenly(87, 73), false);
        assert_eq!(divides_evenly(74, 7), false);
        assert_eq!(divides_evenly(87, 29), true);
        assert_eq!(divides_evenly(48, 24), true);
        assert_eq!(divides_evenly(99, 20), false);
        assert_eq!(divides_evenly(98, 49), true);
        assert_eq!(divides_evenly(100, 6), false);
        assert_eq!(divides_evenly(64, 4), true);
        assert_eq!(divides_evenly(70, 35), true);
        assert_eq!(divides_evenly(38, 38), true);
        assert_eq!(divides_evenly(29, 3), false);
        assert_eq!(divides_evenly(20, 8), false);
        assert_eq!(divides_evenly(66, 50), false);
        assert_eq!(divides_evenly(95, 1), true);
        assert_eq!(divides_evenly(58, 2), true);
    }
}
