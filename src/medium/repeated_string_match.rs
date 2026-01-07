pub fn repeated_string_match(a: String, b: String) -> i32 {
    let mut count: i32 = 1;
    let mut repeated = a.clone();
    while repeated.len() < b.len() {
        count += 1;
        repeated.push_str(&a.as_str());
    }
    if repeated.contains(&b) {
        return count;
    }
    repeated.push_str(&a.as_str());
    if repeated.contains(&b) {
        return count + 1;
    }
    -1
}
