// https://edabit.com/challenge/xKKwvL2zYC8pEvMLG
// https://edabit.com/challenge/wBYQnCytRFNxsL4Gr
pub fn leap_year(year: u16) -> bool {
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}
#[cfg(test)]
mod tests {
    use super::leap_year;
    #[test]
    fn test_leap_year() {
        assert_eq!(leap_year(1850), false);
        assert_eq!(leap_year(1565), false);
        assert_eq!(leap_year(1920), true);
        assert_eq!(leap_year(1924), true);
        assert_eq!(leap_year(1928), true);
        assert_eq!(leap_year(1940), true);
        assert_eq!(leap_year(2021), false);
        assert_eq!(leap_year(2004), true);
        assert_eq!(leap_year(8), true);
        assert_eq!(leap_year(4), true);
        assert_eq!(leap_year(2019), false);
        assert_eq!(leap_year(1970), false);
        assert_eq!(leap_year(1934), false);
        assert_eq!(leap_year(1874), false);
        assert_eq!(leap_year(1968), true);
    }
}
