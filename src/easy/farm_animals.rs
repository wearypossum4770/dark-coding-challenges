pub fn farm_animals(chickens: u8, cows: u8, pigs: u8) -> u8 {
    4 * (cows + pigs) + 2 * chickens
}
#[cfg(test)]
mod tests {
    use super::farm_animals;
    #[test]
    fn test_farm_animals() {
        assert_eq!(farm_animals(5, 2, 8), 50);
        assert_eq!(farm_animals(3, 4, 7), 50);
        assert_eq!(farm_animals(1, 2, 3), 22);
        assert_eq!(farm_animals(3, 5, 2), 34);
    }
}
