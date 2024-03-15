pub fn future_people(population: u16, births: u16) -> u16 {
    population + 360 * births
}
#[cfg(test)]
mod tests {
    use super::future_people;
    #[test]
    fn test_future_people() {
        assert_eq!(future_people(256, 2), 976);
        assert_eq!(future_people(3_248, 6), 5_408);
        assert_eq!(future_people(5_240, 3), 6_320);
    }
}
