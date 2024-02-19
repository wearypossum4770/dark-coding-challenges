// https://leetcode.com/problems/two-sum/
//1. Two Sum
pub fn two_sum(numbers: Vec<i32>, target: i32) -> [usize; 2] {
    if numbers.len() < 3 {
        return [0, 1];
    }
    'outside: for (outdex, outer) in numbers.iter().enumerate() {
        for (index, inner) in numbers.iter().enumerate() {
            if outdex == index {
                continue 'outside;
            }
            if outer + inner == target {
                return [index, outdex];
            }
        }
    }
    [0, 0]
}

#[cfg(test)]
mod tests {
    use super::two_sum;
    #[test]
    fn test_two_sum() {
        assert_eq!(two_sum(Vec::from([2, 7, 11, 15]), 9), [0, 1]);
        assert_eq!(two_sum(Vec::from([3, 3]), 6), [0, 1]);
        assert_eq!(two_sum(Vec::from([3, 2, 4]), 6), [1, 2]);
    }
}
