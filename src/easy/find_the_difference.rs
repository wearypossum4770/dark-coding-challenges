use std::collections::HashMap;

pub fn find_the_difference(s: &str, t: &str) -> char {
    let mut counts = HashMap::new();
    for c in s.chars() {
        *counts.entry(c).or_insert(0) += 1;
    }
    for c in t.chars() {
        let count = counts.entry(c).or_insert(0);
        if *count == 0 {
            return c;
        } else {
            *count -= 1;
        }
    }
    return ' ';
}
