pub fn license_key_formatting(s: String, k: i32) -> String {
    let word = s.replace("-", "").to_uppercase();
    if word.len() < 2 {
        return word;
    }
    let mut result = String::with_capacity(word.len());
    let mut i: i32 = 0;
    for c in word.chars().rev() {
        if c != '-' {
            if i == k {
                result.insert(0, '-');
                i = 0;
            }
            i += 1;
            result.insert(0, c);
        }
    }
    result
}
