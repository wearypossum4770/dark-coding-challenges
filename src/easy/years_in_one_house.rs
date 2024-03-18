pub fn years_in_one_house(age: u32, moves: u32) -> u32 {
    let average = age as f32 / (moves as f32 + 1.0);
    average.round() as u32
}
#[cfg(test)]
mod tests {
    use super::years_in_one_house;
    #[test]
    fn test_years_in_one_house() {
        assert_eq!(years_in_one_house(30, 1), 15);
        assert_eq!(years_in_one_house(15, 2), 5);
        assert_eq!(years_in_one_house(80, 0), 80);
        assert_eq!(years_in_one_house(23, 2), 8);
        assert_eq!(years_in_one_house(31, 2), 10);
        assert_eq!(years_in_one_house(1, 0), 1);
    }
}
