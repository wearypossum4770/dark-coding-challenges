pub fn plus_one(digits: &mut Vec<i32>) -> Vec<i32> {
    let mut result = digits.clone();
    let mut remainder: i32 = 1;
    let mut index = result.len() as i32 - 1;
    while index >= 0 {
        let idx = index as usize;
        if idx >= result.len() {
            break;
        }
        let total = result[idx] + remainder;
        if total <= 9 {
            result[idx] = total;
            return result.to_vec();
        }
        result[idx] = 0;
        remainder = 1;
        if index == 0 {
            break;
        }
        index -= 1;
    }
    if remainder > 0 {
        result.insert(0, 1);
    }
    result.to_vec()
}
#[cfg(test)]
mod tests {
    use super::plus_one;
    use rstest::rstest;
    #[rstest]
    #[case(&[4, 3, 2, 1], &[4, 3, 2, 2])]
    #[case(&[1, 2, 3], &[1, 2, 4])]
    #[case(&[9], &[1, 0])]
    #[case(&[9, 9], &[1, 0, 0])]
    #[case(&[0], &[1])]
    #[case(&[5], &[6])]
    #[case(&[9, 9, 9, 9], &[1, 0, 0, 0, 0])]
    #[case(&[9, 9, 8], &[9, 9, 9])]
    #[case(&[1, 0, 0], &[1, 0, 1])]
    #[case(&[8, 9, 9], &[9, 0, 0])]
    #[case(&[0, 9], &[1, 0])]
    // #[case(&[1, 9, 9], &[2, 0, 0])]
    // #[case(&[9, 9, 9, 9, 9], &[1, 0, 0, 0, 0, 0])]
    fn test_plus_one(#[case] digits: &[i32], #[case] expected: &[i32]) {
        let mut arr = digits.to_vec();
        assert_eq!(plus_one(&mut arr), expected);
    }
}
