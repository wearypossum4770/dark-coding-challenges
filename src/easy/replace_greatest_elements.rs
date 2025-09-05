pub fn replace_greatest_elements(arr: &mut Vec<i32>) -> Vec<i32> {
    let mut max: i32 = -1;
    let mut right: usize = arr.len();
    while right > 0 {
        right -= 1;
        let temp = arr[right];
        arr[right] = max;
        if temp > max {
            max = temp;
        }
    }

    arr.to_vec()
}
#[cfg(test)]
mod tests {
    use super::replace_greatest_elements;
    use rstest::rstest;
    #[rstest]
    #[case("normal case", vec![17, 18, 5, 4, 6, 1], vec![18, 6, 6, 6, 1, -1])]
    #[case("normal case", vec![400, 300, 200, 100], vec![300, 200, 100, -1])]
    #[case("single element array", vec![400], vec![-1])]
    #[case("single element array", vec![0], vec![-1])]
    #[case("two elements array", vec![1, 2], vec![2, -1])]
    #[case("two elements array", vec![2, 1], vec![1, -1])]
    #[case("empty array", vec![], vec![])]
    #[case("all elements equal", vec![5, 5, 5, 5], vec![5, 5, 5, -1])]
    #[case("strictly increasing array", vec![1, 2, 3, 4, 5], vec![5, 5, 5, 5, -1])]
    #[case("strictly decreasing array", vec![5, 4, 3, 2, 1], vec![4, 3, 2, 1, -1])]
    #[case("array with zeros", vec![0, 0, 0, 0], vec![0, 0, 0, -1])]
    #[case("array with zeros", vec![0, 1, 0, 1], vec![1, 1, 1, -1])]
    #[case("with large numbers", vec![100000, 50000, 100001], vec![100001, 100001, -1])]
    #[case("with large numbers", vec![1, 2147395600, 2], vec![2147395600, 2, -1])]
    fn test_replace_greatest_elements(
        #[case] _criteria: &str,
        #[case] arr: Vec<i32>,
        #[case] expected: Vec<i32>,
    ) {
        let num = &mut arr.clone();
        assert_eq!(replace_greatest_elements(num), expected);
    }
}
