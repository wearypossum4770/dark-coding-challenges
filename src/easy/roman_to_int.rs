use crate::helpers::itertools;

pub fn roman_to_int(roman: String) -> i32 {
    let map = itertools::roman_numerals_to_arabic();
    let roman_numerals: Vec<char> = roman.chars().collect();
    roman.char_indices().fold(0, |total, (position, letter)| {
        let current = map.get(&letter).unwrap_or(&0);
        let next = roman_numerals
            .get(position + 1)
            .and_then(|c| map.get(&c))
            .unwrap_or(&0);
        if current < next {
            total - current
        } else {
            total + current
        }
    })
}

#[cfg(test)]
mod tests {
    use super::roman_to_int;
    #[test]
    fn test_roman_numeral_IV() {
        assert_eq!(roman_to_int("IV".to_string()), 4);
    }
    #[test]
    fn test_roman_numeral_XC() {
        assert_eq!(roman_to_int("XC".to_string()), 90);
    }
    #[test]
    fn test_roman_numeral_CM() {
        assert_eq!(roman_to_int("CM".to_string()), 900);
    }
    #[test]
    fn test_roman_numeral_MMM() {
        assert_eq!(roman_to_int("MMM".to_string()), 3_000);
    }
    #[test]
    fn test_roman_numeral_III() {
        assert_eq!(roman_to_int("III".to_string()), 3);
    }
    #[test]
    fn test_roman_numeral_XXVII() {
        assert_eq!(roman_to_int("XXVII".to_string()), 27);
    }
    #[test]
    fn test_roman_numeral_LVIII() {
        assert_eq!(roman_to_int("LVIII".to_string()), 58);
    }
    #[test]
    fn test_roman_numeral_MCMXCIV() {
        assert_eq!(roman_to_int("MCMXCIV".to_string()), 1_994);
    }
    #[test]
    fn test_roman_numeral_MMMCMXCIV() {
        assert_eq!(roman_to_int("MMMCMXCIV".to_string()), 3_994);
    }
    #[test]
    fn test_roman_numeral_I() {
        assert_eq!(roman_to_int("I".to_string()), 1);
    }
    #[test]
    fn test_roman_numeral_VIII() {
        assert_eq!(roman_to_int("VIII".to_string()), 8);
    }
    #[test]
    fn test_roman_numeral_XXIX() {
        assert_eq!(roman_to_int("XXIX".to_string()), 29);
    }
    #[test]
    fn test_roman_numeral_LIV() {
        assert_eq!(roman_to_int("LIV".to_string()), 54);
    }
    #[test]
    fn test_roman_numeral_CCV() {
        assert_eq!(roman_to_int("CCV".to_string()), 205);
    }
    #[test]
    fn test_roman_numeral_CDXLIV() {
        assert_eq!(roman_to_int("CDXLIV".to_string()), 444);
    }
    #[test]
    fn test_roman_numeral_CMXCIX() {
        assert_eq!(roman_to_int("CMXCIX".to_string()), 999);
    }
    #[test]
    fn test_roman_numeral_M() {
        assert_eq!(roman_to_int("M".to_string()), 1_000);
    }
    #[test]
    fn test_roman_numeral_MMMDCCCLXXXVIII() {
        assert_eq!(roman_to_int("MMMDCCCLXXXVIII".to_string()), 3_888);
    }
    #[test]
    fn test_roman_numeral_MMMCMX() {
        assert_eq!(roman_to_int("MMMCMX".to_string()), 3_910);
    }
}
