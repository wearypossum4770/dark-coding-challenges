pub fn get_letters(digit: char) -> &'static str {
    match digit {
        '2' => "abc",
        '3' => "def",
        '4' => "ghi",
        '5' => "jkl",
        '6' => "mno",
        '7' => "pqrs",
        '8' => "tuv",
        '9' => "wxyz",
        _ => "",
    }
}
pub fn letter_combinations(digits: String) -> Vec<String> {
    if digits.is_empty() {
        return Vec::new();
    }

    // Start with a base case: a vector containing one empty string
    let mut result = vec!["".to_string()];

    for digit in digits.chars() {
        let letters = get_letters(digit);
        let mut next_combinations = Vec::new();

        for prev_combo in result {
            for letter in letters.chars() {
                // Create a new string by appending the current letter
                let mut new_combo = prev_combo.clone();
                new_combo.push(letter);
                next_combinations.push(new_combo);
            }
        }
        // Move to the next generation of combinations
        result = next_combinations;
    }

    result
}