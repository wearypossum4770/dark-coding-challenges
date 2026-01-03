pub fn repeated_substring_pattern(s: String) -> bool {
    if s.is_empty() {
        return true;
    }
    let double = s.repeat(2);
    double[1..double.len() - 1].contains(&s)
}
