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