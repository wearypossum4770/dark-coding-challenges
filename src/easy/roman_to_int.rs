use crate::helpers::itertools;
use std::cmp::Ordering;
pub fn roman_to_int(roman: String) -> i32 {
    let map = itertools::roman_numerals_to_arabic();
    let roman_numerals: Vec<char> = roman.chars().collect();
    roman.char_indices().fold(0, |total, (position, letter)| {
        let current = map.get(&letter).unwrap_or(&0);
        let next = roman_numerals
            .get(position + 1)
            .and_then(|c| map.get(c))
            .unwrap_or(&0);

        match current.cmp(next) {
            Ordering::Less => total - current,
            _ => total + current,
        }
    })
}

#[cfg(test)]
mod tests {
    use super::roman_to_int;
    use rstest::rstest;

    #[rstest]
    #[case("IV".to_string(), 4)]
    #[case("XC".to_string(), 90)]
    #[case("CM".to_string(), 900)]
    #[case("MMM".to_string(), 3_000)]
    #[case("III".to_string(), 3)]
    #[case("XXVII".to_string(), 27)]
    #[case("LVIII".to_string(), 58)]
    #[case("MCMXCIV".to_string(), 1_994)]
    #[case("MMMCMXCIV".to_string(), 3_994)]
    #[case("I".to_string(), 1)]
    #[case("VIII".to_string(), 8)]
    #[case("XXIX".to_string(), 29)]
    #[case("LIV".to_string(), 54)]
    #[case("CCV".to_string(), 205)]
    #[case("CDXLIV".to_string(), 444)]
    #[case("CMXCIX".to_string(), 999)]
    #[case("M".to_string(), 1_000)]
    #[case("MMMDCCCLXXXVIII".to_string(), 3_888)]
    #[case("MMMCMX".to_string(), 3_910)]
    fn test_roman_numeral_to_arabic_number(#[case] roman: String, #[case] arabic: i32) {
        assert_eq!(roman_to_int(roman), arabic);
    }
}
