pub fn remove_optional_element(input: &mut [Option<i32>], target: i32) -> i32 {
    let mut count = 0;
    for num in input.iter_mut() {
        if let Some(val) = num {
            if *val == target {
                *num = None;
            } else {
                count += 1;
            }
        }
    }
    count
}
pub fn remove_element(nums: &mut Vec<i32>, target: i32) -> i32 {
    let mut count = 0;
    for index in 0..nums.len() {
        if nums[index] != target {
            nums[count] = nums[index];
            count += 1;
        }
    }
    count as i32
}
#[cfg(test)]
mod tests {
    use super::{remove_optional_element, remove_element};
    use rstest::rstest;

    #[rstest]
    #[case(&mut vec![3, 2, 2, 3], 3, vec![2, 2], 2)]
    fn test_remove_element(#[case] input: &mut Vec<i32>, #[case] target: i32, #[case] _result: Vec<i32>, #[case] count: i32) {
       let output = remove_element(input, target);
       assert_eq!(output, count);
    }
    #[rstest]
    #[case(&mut vec![Some(3), Some(2), Some(2), Some(3)], 3, 2, &mut vec![None, Some(2), Some(2), None])]
    #[case(&mut vec![Some(0), Some(1), Some(2), Some(2), Some(3), Some(0), Some(4), Some(2)], 2, 5, &mut vec![Some(0), Some(1), None, None, Some(3), Some(0), Some(4), None])]
    fn test_remove_optional_element(
        #[case] input: &mut Vec<Option<i32>>,
        #[case] target: i32,
        #[case] expected: i32,
        #[case] mutated: &mut Vec<Option<i32>>,
    ) {
        let result: i32 = remove_optional_element(input, target);
        assert_eq!(input, mutated);
        assert_eq!(result, expected);
    }
}
