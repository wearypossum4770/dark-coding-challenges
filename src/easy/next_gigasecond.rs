use crate::helpers::{DateTimeParts, GIGASECOND};
use time::{Date, Duration, Month, PrimitiveDateTime as DateTime, Time};

pub fn next_gigasecond(start: DateTime) -> DateTime {
    let seconds = Duration::seconds(GIGASECOND as i64);
    match start.checked_add(seconds) {
        Some(date) => date,
        None => start,
    }
}

fn dt(year: i32, month: u8, day: u8, hour: u8, minute: u8, second: u8) -> DateTime {
    let __month__: Month = month.try_into().unwrap();
    let __date__: Date = Date::from_calendar_date(year, __month__, day).unwrap();
    DateTime::new(__date__, Time::from_hms(hour, minute, second).unwrap())
}

#[cfg(test)]
mod tests {
    use super::{dt, next_gigasecond};

    #[test]
    fn test_next_gigasecond() {
        let start_date1 = next_gigasecond(dt(2011, 4, 25, 0, 0, 0));
        let start_date2 = next_gigasecond(dt(1977, 6, 13, 0, 0, 0));
        let start_date3 = next_gigasecond(dt(1959, 7, 19, 0, 0, 0));
        let start_date4 = next_gigasecond(dt(2015, 1, 24, 22, 0, 0));
        let start_date5 = next_gigasecond(dt(2015, 1, 24, 23, 59, 59));
        let result1 = dt(2043, 1, 1, 1, 46, 40);
        let result2 = dt(2009, 2, 19, 1, 46, 40);
        let result3 = dt(1991, 3, 27, 1, 46, 40);
        let result4 = dt(2046, 10, 2, 23, 46, 40);
        let result5 = dt(2046, 10, 3, 1, 46, 39);
        assert_eq!(start_date1, result1);
        assert_eq!(start_date2, result2);
        assert_eq!(start_date3, result3);
        assert_eq!(start_date4, result4);
        assert_eq!(start_date5, result5);
    }
}
