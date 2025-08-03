use std::collections::HashMap;

pub fn is_anagram(first: String, second: String) -> bool {
    if first.len() != second.len() {
        return false;
    }
    let mut char_dict: HashMap<char, u32> = HashMap::new();
    for c in first.chars() {
        *char_dict.entry(c).or_insert(0) += 1;
    }

    for c in second.chars() {
        if let Some(count) = char_dict.get_mut(&c) {
            if *count < 1 {
                return false;
            }
            *count -= 1;
        }
    }
    char_dict.values().all(|&c| c == 0)
}

