#[derive(Debug, Default)]
pub struct Clock {
    total: i32,
    hours: i32,
    minutes: i32,
}

impl PartialEq<Clock> for Clock {
    fn eq(&self, other: &Clock) -> bool {
        self.minutes == other.minutes && self.hours == other.hours
    }
}
impl Clock {
    pub fn init() -> Self {
        Clock::default()
    }

    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut init = Clock::init();
        init.add_minutes(minutes).add_hours(hours);
        init.build()
    }
    fn build(&mut self) -> Self {
        let hour_math: f32 = ((self.total as f32 / 60.0) % 24.0).floor();
        let min_math: i32 = self.total % 60;
        let hours: i32 = match hour_math > 0.0 {
            true => hour_math as i32,
            false => 24 + hour_math as i32,
        };
        let minutes = match min_math > 0 {
            true => min_math,
            false => 60 + min_math,
        };
        println!("{:?}", hours);
        Self {
            hours: hours % 24,
            minutes: minutes % 60,
            total: self.total,
        }
    }
    fn to_string(&mut self) -> String {
        let obj = self.build();
        format!("{:02}:{:02}", obj.hours, obj.minutes)
    }
    fn add_hours(&mut self, hours: i32) -> &mut Self {
        self.total += hours * 60;
        self
    }
    fn add_minutes(&mut self, minutes: i32) -> &mut Self {
        self.total += minutes;
        self
    }
}

#[cfg(test)]
mod tests {
    use super::Clock;

    #[test]
    fn on_the_hour() {
        assert_eq!(Clock::new(8, 0).to_string(), "08:00");
        assert_eq!(Clock::new(11, 9).to_string(), "11:09");
        assert_eq!(Clock::new(24, 0).to_string(), "00:00");
        assert_eq!(Clock::new(25, 0).to_string(), "01:00");
        assert_eq!(Clock::new(100, 0).to_string(), "04:00");
        assert_eq!(Clock::new(1, 60).to_string(), "02:00");
        assert_eq!(Clock::new(0, 160).to_string(), "02:40");
        assert_eq!(Clock::new(0, 1723).to_string(), "04:43");
        assert_eq!(Clock::new(25, 160).to_string(), "03:40");
        assert_eq!(Clock::new(201, 3001).to_string(), "11:01");
        assert_eq!(Clock::new(72, 8640).to_string(), "00:00");
        assert_eq!(Clock::new(-1, 15).to_string(), "23:15");
        assert_eq!(Clock::new(-25, 00).to_string(), "23:00");
        assert_eq!(Clock::new(-91, 00).to_string(), "05:00");
        assert_eq!(Clock::new(1, -40).to_string(), "00:20");
        assert_eq!(Clock::new(1, -160).to_string(), "22:20");
        assert_eq!(Clock::new(1, -4820).to_string(), "16:40");
        assert_eq!(Clock::new(2, -60).to_string(), "01:00");
        assert_eq!(Clock::new(1, -120).to_string(), "23:00");
        assert_eq!(Clock::new(-25, -160).to_string(), "20:20");
        assert_eq!(Clock::new(-121, -5810).to_string(), "22:10");
        assert_eq!(Clock::new(0, -22).to_string(), "23:38");
    }

    #[test]
    fn add_minutes() {
        assert_eq!(Clock::new(10, 0).add_minutes(3).to_string(), "10:03");
        assert_eq!(Clock::new(6, 41).add_minutes(0).to_string(), "06:41");
        assert_eq!(Clock::new(0, 45).add_minutes(40).to_string(), "01:25");
        assert_eq!(Clock::new(10, 0).add_minutes(61).to_string(), "11:01");
        assert_eq!(Clock::new(0, 45).add_minutes(160).to_string(), "03:25");
        assert_eq!(Clock::new(23, 59).add_minutes(2).to_string(), "00:01");
        assert_eq!(Clock::new(5, 32).add_minutes(1500).to_string(), "06:32");
        assert_eq!(Clock::new(1, 1).add_minutes(3500).to_string(), "11:21");
        assert_eq!(Clock::new(10, 3).add_minutes(-3).to_string(), "10:00");
        assert_eq!(Clock::new(10, 3).add_minutes(-30).to_string(), "09:33");
        assert_eq!(Clock::new(10, 3).add_minutes(-70).to_string(), "08:53");
        assert_eq!(Clock::new(0, 3).add_minutes(-4).to_string(), "23:59");
        assert_eq!(Clock::new(0, 0).add_minutes(-160).to_string(), "21:20");
        assert_eq!(Clock::new(6, 15).add_minutes(-160).to_string(), "03:35");
        assert_eq!(Clock::new(5, 32).add_minutes(-1500).to_string(), "04:32");
        assert_eq!(Clock::new(2, 20).add_minutes(-3000).to_string(), "00:20");
    }
    //
    // Test Equality
    //
    #[test]

    fn compare_clocks_for_equality() {
        assert_eq!(Clock::new(15, 37), Clock::new(15, 37));
    }
    #[test]

    fn compare_clocks_a_minute_apart() {
        assert_ne!(Clock::new(15, 36), Clock::new(15, 37));
    }
    #[test]

    fn compare_clocks_an_hour_apart() {
        assert_ne!(Clock::new(14, 37), Clock::new(15, 37));
    }
    #[test]

    fn compare_clocks_with_hour_overflow() {
        assert_eq!(Clock::new(10, 37), Clock::new(34, 37));
    }
    #[test]

    fn compare_clocks_with_hour_overflow_by_several_days() {
        assert_eq!(Clock::new(99, 11), Clock::new(3, 11));
    }
    #[test]

    fn compare_clocks_with_negative_hour() {
        assert_eq!(Clock::new(-2, 40), Clock::new(22, 40));
    }
    #[test]

    fn compare_clocks_with_negative_hour_that_wraps() {
        assert_eq!(Clock::new(-31, 3), Clock::new(17, 3));
    }
    #[test]

    fn compare_clocks_with_negative_hour_that_wraps_multiple_times() {
        assert_eq!(Clock::new(-83, 49), Clock::new(13, 49));
    }
    #[test]

    fn compare_clocks_with_minutes_overflow() {
        assert_eq!(Clock::new(0, 1441), Clock::new(0, 1));
    }
    #[test]

    fn compare_clocks_with_minutes_overflow_by_several_days() {
        assert_eq!(Clock::new(2, 4322), Clock::new(2, 2));
    }
    #[test]

    fn compare_clocks_with_negative_minute() {
        assert_eq!(Clock::new(3, -20), Clock::new(2, 40));
    }
    #[test]

    fn compare_clocks_with_negative_minute_that_wraps() {
        assert_eq!(Clock::new(5, -1490), Clock::new(4, 10));
    }
    #[test]

    fn compare_clocks_with_negative_minute_that_wraps_multiple() {
        assert_eq!(Clock::new(6, -4305), Clock::new(6, 15));
    }
    #[test]

    fn compare_clocks_with_negative_hours_and_minutes() {
        assert_eq!(Clock::new(-12, -268), Clock::new(7, 32));
    }
    #[test]

    fn compare_clocks_with_negative_hours_and_minutes_that_wrap() {
        assert_eq!(Clock::new(-54, -11_513), Clock::new(18, 7));
    }
    #[test]

    fn compare_full_clock_and_zeroed_clock() {
        assert_eq!(Clock::new(24, 0), Clock::new(0, 0));
    }
}
