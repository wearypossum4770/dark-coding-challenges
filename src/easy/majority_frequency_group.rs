use std::collections::HashMap;

pub fn majority_frequency_group(s: String) -> String {
    let mut freq: HashMap<char, u8> = HashMap::new();
    let mut entries: HashMap<u8, String> = HashMap::new();
    for c in s.chars() {
        *freq.entry(c).or_insert(0) += 1;
    }
    for (&c, &count) in freq.iter() {
        entries.entry(count).or_default().push(c);
    }
    entries
        .into_iter()
        .max_by(|(count_a, chars_a), (count_b, chars_b)| {
            chars_a
                .len()
                .cmp(&chars_b.len())
                .then(count_a.cmp(&count_b))
        })
        .map(|(_, chars)| chars)
        .unwrap_or_default()
}
