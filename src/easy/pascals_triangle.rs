pub fn pascals_triangle(num_rows: i32) -> Vec<Vec<i32>> {
    let mut result: Vec<Vec<i32>> = Vec::new();
    if num_rows <= 0 {
        return result;
    }
    result.push(vec![1]);
    for i in 1..num_rows as usize {
        let mut row: Vec<i32> = vec![1; i + 1];
        for j in 1..i {
            row[j] = result[i - 1][j - 1] + result[i - 1][j];
        }
        result.push(row);
    }

    result
}
#[cfg(test)]
mod tests {
    use super::pascals_triangle;
    use rstest::rstest;
    #[rstest]
    #[case(0, vec![])]
    #[case(1, vec![vec![1]])]
    #[case(2, vec![vec![1], vec![1, 1]])]
    #[case(3, vec![vec![1], vec![1, 1], vec![1, 2, 1]])]
    #[case(4, vec![vec![1], vec![1, 1], vec![1, 2, 1], vec![1, 3, 3, 1]])]
    #[case(5, vec![vec![1], vec![1, 1], vec![1, 2, 1], vec![1, 3, 3, 1], vec![1, 4, 6, 4, 1]])]
    #[case(6, vec![vec![1], vec![1, 1], vec![1, 2, 1], vec![1, 3, 3, 1], vec![1, 4, 6, 4, 1], vec![1, 5, 10, 10, 5, 1]])]
    fn test_pascals_triangle(#[case] rows: i32, #[case] expected: Vec<Vec<i32>>) {
        assert_eq!(pascals_triangle(rows), expected);
    }
}
