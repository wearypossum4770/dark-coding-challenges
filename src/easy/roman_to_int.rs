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

