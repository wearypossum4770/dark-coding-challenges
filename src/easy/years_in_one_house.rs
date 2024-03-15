pub fn years_in_one_house() -> bool {
    //
}
#[cfg(test)]
mod tests {
    use super::years_in_one_house;
    #[test]
    fn test_years_in_one_house() {
        assert_eq!(years_in_one_house(parameters), returnvalue);
        assert_eq!(years_in_one_house(30, 1), 15);
        assert_eq!(years_in_one_house(15, 2), 5);
        assert_eq!(years_in_one_house(80, 0), 80);
        assert_eq!(years_in_one_house(23, 2), 8);
        assert_eq!(years_in_one_house(31, 2), 10);
        assert_eq!(years_in_one_house(1, 0), 1);
    }
}
