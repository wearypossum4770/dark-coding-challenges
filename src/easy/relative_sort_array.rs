use std::collections::HashMap;

pub fn relative_sort_array(arr1: Vec<i32>, arr2: Vec<i32>) -> Vec<i32> {
    let mut result = vec![0; arr1.len()];
    let mut freq: HashMap<i32, i32> = HashMap::with_capacity(arr1.len());
    let mut index: usize = 0;
    for &num in &arr1 {
        *freq.entry(num).or_insert(0) += 1;
    }
    for &num in &arr2 {
        if let Some(&count) = freq.get(&num) {
            for _ in 0..count {
                result[index] = num;
                index += 1;
            }
            freq.remove(&num);
        }
    }
    let mut keys: Vec<i32> = freq.keys().copied().collect();
    keys.sort();

    for num in keys {
        if let Some(&count) = freq.get(&num) {
            for _ in 0..count {
                result[index] = num;
                index += 1;
            }
        }
    }
    result
}
#[cfg(test)]
mod tests {
    use super::relative_sort_array;
    use rstest::rstest;
    #[rstest]
    #[case(&[2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19], &[2, 1, 4, 3, 9, 6], &[2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19])]
    #[case(&[28, 6, 22, 8, 44, 17], &[22, 28, 8, 6], &[22, 28, 8, 6, 17, 44])]
    #[case(&[5, 3, 8, 1, 9, 2], &[], &[1, 2,3, 5, 8, 9])]
    #[case(&[5, 5, 2, 2, 8, 8], &[2, 5, 8], &[2, 2, 5, 5, 8, 8])]
    #[case(&[42], &[42], &[42])]
    #[case(&[100, 1, 100, 2], &[1, 2], &[1, 2, 100, 100])]
    #[case(&[3, 3, 3, 3, 3], &[3], &[3, 3, 3, 3, 3])]
    #[case(&[0], &[0], &[0])]
    #[case(&[], &[1, 2, 3], &[])]
    #[case(&[7, 1, 7, 1, 7], &[7, 1], &[7, 7, 7, 1, 1])]
    #[case(&[999, 0, 500, 1000, 0], &[0, 1000], &[0, 0, 1000, 500, 999])]
    #[case(&[1, 2, 3, 4, 5], &[5, 4, 3, 2, 1], &[5, 4, 3, 2, 1])]

    fn test_relative_sort_array(
        #[case] arr1: &[i32],
        #[case] arr2: &[i32],
        #[case] expected: &[i32],
    ) {
        assert_eq!(
            relative_sort_array(arr1.to_vec(), arr2.to_vec()),
            expected.to_vec()
        );
    }
}
