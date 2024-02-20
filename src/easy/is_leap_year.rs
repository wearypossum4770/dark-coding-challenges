pub fn is_leap_year(year: i32) -> bool {
    if year % 4 != 0 {
        return false;
    }
    if year % 400 != 0 && year % 100 == 0 {
        return false;
    }
    true
}
#[cfg(test)]
mod tests {
    use super::is_leap_year;
    #[test]
    fn test_is_leap_year() {
        assert_eq!(is_leap_year(2015), false);
        assert_eq!(is_leap_year(1970), false);
        assert_eq!(is_leap_year(1996), true);
        assert_eq!(is_leap_year(1960), true);
        assert_eq!(is_leap_year(2100), false);
        assert_eq!(is_leap_year(1900), false);
        assert_eq!(is_leap_year(2000), true);
        assert_eq!(is_leap_year(2400), true);
        assert_eq!(is_leap_year(1800), false);
    }
}
