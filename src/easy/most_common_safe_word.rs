use std::collections::{HashMap, HashSet};

pub fn most_common_safe_word(paragraph: String, banned: Vec<String>) -> String {
    let separators = ['!', '?', '\'', ',', ';', '.', ' '];
    let banished: HashSet<String> = banned.into_iter().collect();
    let mut freq: HashMap<String, i32> = HashMap::new();

    paragraph
        .to_lowercase()
        .split(|ch| separators.contains(&ch))
        .filter(|word| !word.is_empty() && !banished.contains(*word))
        .for_each(|word| {
            *freq.entry(word.to_string()).or_insert(0) += 1;
        });
    freq.into_iter()
        .max_by_key(|(_, count)| *count)
        .map(|(word, _)| word)
        .unwrap_or_default()
}
