pub fn raindrops(drop: i32) -> String {
    let modulus: [i32; 3] = [3, 5, 7];
    let words: [&str; 3] = ["Pling", "Plang", "Plong"];
    let mut target: String = String::with_capacity(15);
    for (index, num) in modulus.iter().enumerate() {
        if drop % num == 0 {
            target.push_str(words[index]);
        }
    }
    if !target.is_empty() {
        target
    } else {
        drop.to_string()
    }
}
#[cfg(test)]
mod tests {
    use super::raindrops;
    #[test]
    fn test_raindrops() {
        assert_eq!(raindrops(1), "1".to_string());
        assert_eq!(raindrops(3), "Pling".to_string());
        assert_eq!(raindrops(5), "Plang".to_string());
        assert_eq!(raindrops(7), "Plong".to_string());
        assert_eq!(raindrops(6), "Pling".to_string());
        assert_eq!(raindrops(9), "Pling".to_string());
        assert_eq!(raindrops(10), "Plang".to_string());
        assert_eq!(raindrops(14), "Plong".to_string());
        assert_eq!(raindrops(15), "PlingPlang".to_string());
        assert_eq!(raindrops(21), "PlingPlong".to_string());
        assert_eq!(raindrops(25), "Plang".to_string());
        assert_eq!(raindrops(35), "PlangPlong".to_string());
        assert_eq!(raindrops(49), "Plong".to_string());
        assert_eq!(raindrops(52), "52".to_string());
        assert_eq!(raindrops(105), "PlingPlangPlong".to_string());
        assert_eq!(raindrops(12121), "12121".to_string());
    }
}
