use std::collections::HashMap;

pub fn frequency_sort(s: String) -> String {
    let mut result = String::new();
    let mut freq: HashMap<char, usize> = HashMap::new();
    for c in s.chars() {
        *freq.entry(c).or_insert(0) += 1;
    }
    let mut values: Vec<(char, usize)> = freq.into_iter().collect();
    values.sort_by(|a, b| b.1.cmp(&a.1));
    for (c, count) in values.iter() {
        result.extend(std::iter::repeat(c).take(*count));
    }
    result
}