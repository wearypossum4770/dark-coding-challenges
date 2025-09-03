pub fn remove_duplicate_zeros(arr: &mut Vec<i32>) {
    let mut left = 0;
    let right = arr.len() - 1;
    while left <= right {
        let mut r = right;
        if arr[left] == 0 {
            while r > left {
                arr[r] = arr[r - 1];
                r -= 1;
            }
            left += 1;
        }
        left += 1;
    }
}
#[cfg(test)]
mod tests {
    use super::remove_duplicate_zeros;
    use rstest::rstest;
    #[rstest]
    #[case(vec![1, 0, 2, 3, 0, 4, 5, 0 ], vec![ 1, 0, 0, 2, 3, 0, 0, 4 ])]
    #[case(vec![1, 2, 3 ], vec![ 1, 2, 3 ])]
    #[case(vec![0, 0, 0 ], vec![ 0, 0, 0 ])]
    #[case(vec![0 ], vec![ 0 ])]
    #[case(vec![7 ], vec![ 7 ])]
    #[case(vec![1, 2, 0 ], vec![ 1, 2, 0 ])]
    #[case(vec![0, 1, 0, 2, 0, 3 ], vec![ 0, 0, 1, 0, 0, 2 ])]
    fn test_remove_duplicate_zeros(#[case] nums: Vec<i32>, #[case] expected: Vec<i32>) {
        let mutation = &mut nums.clone();
        remove_duplicate_zeros(mutation);
        assert_eq!(mutation, &expected);
    }
}
