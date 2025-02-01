use std::collections::HashMap;
/// [Leet Code](https://leetcode.com/problems/two-sum/)
/// [Code Signal](https://learn.codesignal.com/preview/lessons/1609/)
/// Runtime: 0 ms Beats 100.00%
/// Memory: 2.63 MB Beats 20.47%
/**
 * Function to find the indices of the two numbers that add up to the target.
 *
 * # Arguments
 *
 * * `nums` - A vector of integers.
 * * `target` - The target sum.
 *
 * # Returns
 *
 * A vector containing the indices of the two numbers that add up to the target.
 *
 * # Panics
 *
 * Panics if no two sum solution is found.
 */
pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let mut mapper: HashMap<i32, usize> = HashMap::new();
    for (index, &num) in nums.iter().enumerate() {
        if let Some(&value) = mapper.get(&(target - num)) {
            return vec![value as i32, index as i32];
        }
        mapper.insert(num, index);
    }
    vec![]
}

#[cfg(test)]
mod tests {
    use super::two_sum;
    #[test]
    fn test_numeric_order_non_consecutive() {
        let nums = vec![2, 7, 11, 15];
        let target = 9;
        assert_eq!(two_sum(nums, target), vec![0, 1]);
    }

    #[test]
    fn test_unordered() {
        let nums = vec![3, 2, 4];
        let target = 6;
        assert_eq!(two_sum(nums, target), vec![1, 2]);
    }

    #[test]
    fn test_same_elements() {
        let nums = vec![3, 3];
        let target = 6;
        assert_eq!(two_sum(nums, target), vec![0, 1]);
    }

    #[test]
    fn test_palindromic_array() {
        let nums = vec![3, 2, 3];
        let target = 6;
        assert_eq!(two_sum(nums, target), vec![0, 2]);
    }

    #[test]
    fn test_inner_sandwich() {
        let nums = vec![2, 5, 5, 11];
        let target = 10;
        assert_eq!(two_sum(nums, target), vec![1, 2]);
    }

    #[test]
    fn test_outer_sandwich() {
        let nums = vec![0, 4, 3, 0];
        let target = 0;
        assert_eq!(two_sum(nums, target), vec![0, 3]);
    }

    #[test]
    fn test_with_negative_numbers() {
        let nums = vec![-3, 4, 3, 90];
        let target = 0;
        assert_eq!(two_sum(nums, target), vec![0, 2]);
    }

    #[test]
    fn test_consecutively_smaller() {
        let nums = vec![-1, -2, -3, -4, -5];
        let target = -8;
        assert_eq!(two_sum(nums, target), vec![2, 4]);
    }

    #[test]
    fn test_large_numbers() {
        let nums = vec![5, 75, 25];
        let target = 100;
        assert_eq!(two_sum(nums, target), vec![1, 2]);
    }

    #[test]
    fn test_large_identical_numbers() {
        let nums = vec![2_222_222, 2_222_222];
        let target = 4_444_444;
        assert_eq!(two_sum(nums, target), vec![0, 1]);
    }

    #[test]
    fn test_mixed_large_numbers() {
        let nums = vec![1, 6142, 8192, 10239];
        let target = 18431;
        assert_eq!(two_sum(nums, target), vec![2, 3]);
    }

    #[test]
    fn test_all_negative_numbers() {
        let nums = vec![-10, -1, -18, -19];
        let target = -19;
        assert_eq!(two_sum(nums, target), vec![1, 2]);
    }

    #[test]
    fn test_negative_and_positive_numbers() {
        let nums = vec![-10, 7, 19, 15];
        let target = 9;
        assert_eq!(two_sum(nums, target), vec![0, 2]);
    }

    #[test]
    fn test_zero_with_negatives() {
        let nums = vec![0, 3, -3, 4, -1];
        let target = -1;
        assert_eq!(two_sum(nums, target), vec![0, 4]);
    }

    #[test]
    fn test_combined_negative_and_positive() {
        let nums = vec![-18, 12, 3, 0];
        let target = -6;
        assert_eq!(two_sum(nums, target), vec![0, 1]);
    }

    #[test]
    fn test_mixed_small_numbers() {
        let nums = vec![1, 3, 4, 2];
        let target = 6;
        assert_eq!(two_sum(nums, target), vec![2, 3]);
    }
    #[test]
    fn test_positive_and_negative_sum_to_target() {
        let nums = vec![1, 3, 5, 2, 8, -2];
        let target = 6;
        assert_eq!(two_sum(nums, target), vec![0, 2]);
    }
}
