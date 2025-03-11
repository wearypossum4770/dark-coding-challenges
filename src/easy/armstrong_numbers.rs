pub fn armstrong_numbers(num: i32) -> u8 {
    if num < 0 {
        return 0;
    };
    let digits = num.to_string();
    let power: u32 = digits.len().try_into().unwrap_or(1);
    let sum = digits
        .chars()
        .fold(0, |acc, x| acc + x.to_digit(10).unwrap_or(0).pow(power));
    match sum == num.try_into().unwrap() {
        true => 1,
        false => 0,
    }
}
