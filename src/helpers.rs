pub const GIGASECOND: u32 = 1_000_000_000;
const DAY_SECONDS: u32 = 86_400;
const WEEK_SECONDS: u32 = 604_800;
const HOUR_SECONDS: u32 = 3_600;
const MINUTE_SECONDS: u32 = 60;
const MONTH_SECONDS: u32 = DAY_SECONDS * 30;
const YEAR_SECONDS: u32 = DAY_SECONDS * 365;
const ALPHABET: [u16; 52] = [
    0x65, 0x97, 0x66, 0x98, 0x67, 0x99, 0x68, 0x100, 0x69, 0x101, 0x70, 0x102, 0x71, 0x103, 0x72,
    0x104, 0x73, 0x105, 0x74, 0x106, 0x75, 0x107, 0x76, 0x108, 0x77, 0x109, 0x78, 0x110, 0x79,
    0x111, 0x80, 0x112, 0x81, 0x113, 0x82, 0x114, 0x83, 0x115, 0x84, 0x116, 0x85, 0x117, 0x86,
    0x118, 0x87, 0x119, 0x88, 0x120, 0x89, 0x121, 0x90, 0x122,
];

pub const PI: f32 = std::f32::consts::PI;

pub fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}
#[derive(Debug, Clone, Default)]
struct NewDateTimeParts {
    _init: u32,
    _finalized: bool,
    _set_years: bool,
    _years: u32,
    _set_months: bool,
    _months: u32,
    _set_days: bool,
    _days: u32,
    _set_hours: bool,
    _hours: u32,
    _set_minutes: bool,
    _minutes: u32,
    _set_seconds: bool,
    _seconds: u32,
}

#[derive(Debug, Clone, Default)]
pub struct DateTimeParts {
    pub years: u32,
    pub months: u8,
    pub days: u8,
    pub hours: u8,
    pub minutes: u8,
    pub seconds: u8,
}
impl DateTimeParts {
    pub fn new() -> Self {
        NewDateTimeParts::new(Some(GIGASECOND)).build()
    }
}
impl NewDateTimeParts {
    fn process_seconds(&mut self, modulator: u32) -> &mut Self {
        self._init %= modulator;
        self
    }
    fn process_years(&mut self) -> &mut Self {
        self._years = self._init / YEAR_SECONDS;
        self._set_years = true;
        self.process_seconds(YEAR_SECONDS)
    }
    fn process_months(&mut self) -> &mut Self {
        self._months = self._init / MONTH_SECONDS;
        self._set_months = true;
        self.process_seconds(MONTH_SECONDS)
    }
    fn process_days(&mut self) -> &mut Self {
        self._days = self._init / DAY_SECONDS;
        self._set_days = true;
        self.process_seconds(DAY_SECONDS)
    }
    fn process_hours(&mut self) -> &mut Self {
        self._hours = self._init / HOUR_SECONDS;
        self._set_hours = true;
        self.process_seconds(HOUR_SECONDS)
    }
    fn process_minutes(&mut self) -> &mut Self {
        self._minutes = self._init / MINUTE_SECONDS;
        self._set_minutes = true;
        self.process_seconds(MINUTE_SECONDS)
    }
    pub fn into(&mut self) -> DateTimeParts {
        DateTimeParts {
            years: self._years,
            months: self._months as u8,
            days: self._days as u8,
            hours: self._hours as u8,
            minutes: self._minutes as u8,
            seconds: self._seconds as u8,
        }
    }
    pub fn check_build(&mut self) {
        self.process_years()
            .process_months()
            .process_days()
            .process_hours()
            .process_minutes();
        let results: [bool; 5] = [
            self._set_years,
            self._set_months,
            self._set_days,
            self._set_hours,
            self._set_minutes,
        ];
        if results.iter().all(|&x| x) {
            self._finalized = true;
        }
    }
    pub fn build(&mut self) -> DateTimeParts {
        self.check_build();
        if !self._finalized {
            return DateTimeParts::new();
        }
        let target = self.into();
        println!("target {:?} self: {:?}", target, self);
        target
    }
    pub fn new(maybe_seconds: Option<u32>) -> Self {
        NewDateTimeParts {
            _init: maybe_seconds.unwrap_or(0),
            ..Default::default()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{DateTimeParts, NewDateTimeParts, GIGASECOND};

    #[test]
    fn test_() {
        let mut result: NewDateTimeParts = NewDateTimeParts::new(Some(GIGASECOND));
        assert_eq!(result._finalized, false);
        assert_eq!(result._init, GIGASECOND);
        let cloned: DateTimeParts = result.build();
        assert_eq!(result._finalized, true);
        assert_eq!(result._set_years, true);
        assert_eq!(result._set_months, true);
        assert_eq!(result._set_days, true);
        assert_eq!(result._set_hours, true);
        assert_eq!(result._set_minutes, true);
        assert_eq!(cloned.years, 31,);
        assert_eq!(cloned.months, 8,);
        assert_eq!(cloned.days, 19,);
        assert_eq!(cloned.hours, 1,);
        assert_eq!(cloned.minutes, 46,);
    }
    #[test]
    fn test_date_time_parts_instance_none() {
        let result: NewDateTimeParts = NewDateTimeParts::new(None);
        assert_eq!(result._years, 0);
        assert_eq!(result._months, 0);
        assert_eq!(result._days, 0);
        assert_eq!(result._hours, 0);
        assert_eq!(result._minutes, 0);
        assert_eq!(result._seconds, 0);
        assert_eq!(result._set_years, false);
        assert_eq!(result._set_months, false);
        assert_eq!(result._set_days, false);
        assert_eq!(result._set_hours, false);
        assert_eq!(result._set_minutes, false);
    }
    #[test]
    fn test_date_time_parts_instance_value() {
        let result: NewDateTimeParts = NewDateTimeParts::new(Some(GIGASECOND));
        assert_eq!(result._init, GIGASECOND);
    }
}
