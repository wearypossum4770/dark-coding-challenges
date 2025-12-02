pub fn day_of_the_week(day: i32, month: i32, year: i32) -> String {
    let offset = vec![0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    let day_names = vec![
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ];
    let mut y = year;
    if month < 3 {
        y -= 1;
    }
    let modifier = offset[month as usize - 1];
    let index = y + y / 4 - y / 100 + y / 400 + modifier + day;
    day_names.get(index as usize % 7).unwrap().to_string()
}
#[cfg(test)]
mod tests {
    use super::day_of_the_week;
    use rstest::rstest;
    #[rstest]
    #[case(31, 8, 2019, "Saturday")]
    #[case(18, 7, 1999, "Sunday")]
    #[case(15, 8, 1993, "Sunday")]
    #[case(29, 2, 2016, "Monday")]
    #[case(1, 1, 1971, "Friday")]
    #[case(31, 12, 1971, "Friday")]
    #[case(1, 1, 2100, "Friday")]
    #[case(31, 12, 2100, "Friday")]
    #[case(29, 2, 1972, "Tuesday")]
    #[case(29, 2, 2000, "Tuesday")]
    #[case(1, 3, 2100, "Monday")]
    #[case(1, 3, 2020, "Sunday")]
    #[case(31, 3, 2020, "Tuesday")]
    #[case(28, 2, 2019, "Thursday")]
    #[case(1, 3, 2019, "Friday")]
    #[case(29, 2, 2020, "Saturday")]
    #[case(1, 3, 2020, "Sunday")]
    #[case(4, 7, 1976, "Sunday")]
    #[case(1, 1, 2000, "Saturday")]
    #[case(11, 9, 2001, "Tuesday")]
    #[case(30, 12, 1999, "Thursday")]
    #[case(31, 12, 1999, "Friday")]
    #[case(1, 1, 2000, "Saturday")]
    #[case(30, 4, 2021, "Friday")]
    #[case(1, 5, 2021, "Saturday")]
    #[case(2, 5, 2021, "Sunday")]
    #[case(10, 10, 2010, "Sunday")]
    #[case(14, 2, 2023, "Tuesday")]
    #[case(25, 12, 1995, "Monday")]
    fn test_day_of_the_week(
        #[case] d: i32,
        #[case] m: i32,
        #[case] y: i32,
        #[case] expected: &str,
    ) {
        assert_eq!(day_of_the_week(d, m, y), expected.to_string());
    }
}
