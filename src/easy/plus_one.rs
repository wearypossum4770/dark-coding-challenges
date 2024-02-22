/// Runtime 0ms Beats 100.00% of users with Rust
/// Memory 2.13MB Beats 52.00% of users with Rust
/// https://leetcode.com/problems/plus-one/
/// Leet Code #66
pub fn plus_one(digits: Vec<i32>) -> Vec<i32> {
    let mut carry = 1;
    let mut target = Vec::with_capacity(digits.len());
    for num in digits.iter().rev() {
        let sum = num + carry;
        target.push(sum % 10);
        carry = sum / 10;
    }
    if carry > 0 {
        target.push(carry);
    }
    target.reverse();
    target
}
#[cfg(test)]
mod tests {
    use super::plus_one;
    #[test]
    fn test_plus_one() {
        assert_eq!(plus_one([1, 2, 3].to_vec()), [1, 2, 4]);
        assert_eq!(plus_one([4, 3, 2, 1].to_vec()), [4, 3, 2, 2]);
        assert_eq!(plus_one([9].to_vec()), [1, 0]);
        assert_eq!(plus_one([0].to_vec()), [1]);
        assert_eq!(plus_one([1, 8].to_vec()), [1, 9]);
        assert_eq!(plus_one([1, 9].to_vec()), [2, 0]);
        assert_eq!(plus_one([9, 9].to_vec()), [1, 0, 0]);
    }
}
