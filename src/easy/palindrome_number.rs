pub fn palindrome_number(x: i32) -> bool {
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false;
    }
    let num_string: Vec<u8> = x.to_string().chars().map(|c| c as u8).collect();
    let mut right = num_string.len().saturating_sub(1);
    for num in &num_string {
        if *num != *num_string.get(right).unwrap_or(&(0xff_u8)) {
            return false;
        }
        right = right.saturating_sub(1);
    }
    true
}