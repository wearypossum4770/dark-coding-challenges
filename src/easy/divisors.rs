pub fn divisors(integer: u32) -> Result<Vec<u32>, String> {
    let mut target: Vec<u32> = Vec::new();
    for i in 2..integer {
        if integer % i == 0 {
            target.push(i);
        }
    }
    match target.is_empty() {
        true => Err(format!("{} is prime", integer)),
        false => Ok(target),
    }
}
#[cfg(test)]
mod tests {
    use super::divisors;
    #[test]
    fn test_divisors() {
        assert_eq!(divisors(15), Ok(vec![3, 5]));
        assert_eq!(divisors(36), Ok(vec![3, 5, 6]));
        assert_eq!(divisors(12), Ok(vec![2, 3, 4, 6]));
        assert_eq!(divisors(13), Err("13 is prime".to_string()));
    }
}
