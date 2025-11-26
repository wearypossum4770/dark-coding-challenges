use std::collections::HashMap;

pub fn top_frequent_words(words: Vec<String>, k: i32) -> Vec<String> {
    let mut freq: HashMap<&String, i32> = HashMap::new();
    for word in words.iter() {
        freq.entry(word).and_modify(|c| *c += 1).or_insert(1);
    }
    let mut sorted: Vec<(&&String, &i32)> = freq.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    let result = sorted
        .iter()
        .map(|(key, _)| key.to_string())
        .collect::<Vec<String>>();
    result[0..k as usize].to_vec()
}