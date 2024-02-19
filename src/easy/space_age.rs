pub fn space_age(planet: &str, seconds: i32) -> f64 {
    let earth_years: f64 = 31_557_600.0;
    let age = seconds as f64;
    let orbital_periods: f64 = match planet {
        "mercury" => 0.2408467,
        "venus" => 0.61519726,
        "mars" => 1.8808158,
        "jupiter" => 11.862615,
        "saturn" => 29.447498,
        "uranus" => 84.016846,
        "neptune" => 164.79132,
        _ => 1.0,
    };

    age / earth_years / orbital_periods
}
#[cfg(test)]
mod tests {
    use super::space_age;
    use float_eq::assert_float_eq;
    #[test]
    fn test_space_age() {
        assert_float_eq!(space_age("earth", 1000000000), 31.69);
        assert_float_eq!(space_age("mercury", 2134835688), 280.88);
        assert_float_eq!(space_age("venus", 189839836), 9.78);
        assert_float_eq!(space_age("mars", 2129871239), 35.88);
        assert_float_eq!(space_age("jupiter", 901876382), 2.41);
        assert_float_eq!(space_age("saturn", 2000000000), 2.15);
        assert_float_eq!(space_age("uranus", 1210123456), 0.46);
        assert_float_eq!(space_age("neptune", 1821023456), 0.35);
    }
}
