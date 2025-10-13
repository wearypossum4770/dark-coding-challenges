
pub fn string_integer_is_balanced(num: String) -> bool {
    let mut even: u32 = 0;
    let mut odd: u32 = 0;
    for (i, n) in num.chars().enumerate() {
        let value = n.to_digit(10).unwrap_or(0);
        if i % 2 == 0 {
            even += value;
        } else {
            odd += value
        }
    }

    even == odd
}
