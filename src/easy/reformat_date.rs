pub fn reformat_date(date: String) -> String {
    let parts: Vec<&str> = date.split(" ").collect();
    let month = vec![
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    ]
    .iter()
    .position(|&x| x == parts[1])
    .unwrap_or(0)
        + 1;
    let mut day: u32 = 0;
    for i in parts[0].chars() {
        if i.is_numeric() {
            day = day * 10 + i.to_digit(10).unwrap_or(0);
        }
    }
    format!("{}-{:0>2}-{:0>2}", parts[2], month, day)
}
#[cfg(test)]
mod tests {
    use super::reformat_date;
    use rstest::rstest;
    #[rstest]
    #[case("20th Oct 2052", "2052-10-20")]
    #[case("6th Jun 1933", "1933-06-06")]
    #[case("26th May 1960", "1960-05-26")]
    #[case("1st Jan 1900", "1900-01-01")]
    #[case("31st Dec 2100", "2100-12-31")]
    #[case("2nd Feb 2000", "2000-02-02")]
    #[case("3rd Mar 1999", "1999-03-03")]
    #[case("4th Apr 2010", "2010-04-04")]
    #[case("9th Sep 2021", "2021-09-09")]
    #[case("10th Oct 2020", "2020-10-10")]
    #[case("11th Nov 2011", "2011-11-11")]
    #[case("12th Dec 2012", "2012-12-12")]
    #[case("21st Aug 1987", "1987-08-21")]
    #[case("22nd Jul 1975", "1975-07-22")]
    #[case("23rd Mar 1965", "1965-03-23")]
    #[case("30th Apr 1990", "1990-04-30")]
    #[case("28th Feb 2001", "2001-02-28")]
    #[case("29th Feb 2000", "2000-02-29")]
    #[case("7th Jul 2007", "2007-07-07")]
    #[case("8th Aug 1988", "1988-08-08")]
    fn test_reformat_date(#[case] date: &str, #[case] expected: &str) {
        assert_eq!(reformat_date(date.to_string()), expected.to_string());
    }
}
