use std::collections::HashSet;

pub fn is_pangram(text: &str) -> bool {
    let characters: HashSet<char> = text
        .to_lowercase()
        .chars()
        .filter(|letter| letter.is_ascii_alphabetic())
        .collect::<HashSet<char>>();
    characters.len() == 26
}
