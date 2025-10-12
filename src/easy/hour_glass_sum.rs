use std::f32::INFINITY;

pub fn hour_glass_sum(matrix: Vec<Vec<i32>>) -> i32 {
    let mut max = -INFINITY;
    for (i, row) in matrix[0..matrix.len() - 2].iter().enumerate() {
        for (j, _cell) in row[0..row.len() - 2].iter().enumerate() {
            let sum = matrix[i][j]
                + matrix[i][j + 1]
                + matrix[i][j + 2]
                + matrix[i + 1][j + 1]
                + matrix[i + 2][j]
                + matrix[i + 2][j + 1]
                + matrix[i + 2][j + 2];
            max = max.max(sum as f32);
        }
    }
    max as i32
}
#[cfg(test)]
mod tests {
    use super::hour_glass_sum;
    use rstest::rstest;
    #[rstest]
    #[case(
			vec![
				vec![1, 1, 1, 0, 0, 0],
				vec![0, 1, 0, 0, 0, 0],
				vec![1, 1, 1, 0, 0, 0],
				vec![0, 9, 2, -4, -4, 0],
				vec![0, 0, 0, -2, 0, 0],
				vec![0, 0, -1, -2, -4, 0]
				],
				13)]
    #[case(
			vec![
				vec![-1, -1, 0, -9, -2, -2],
				vec![-2, -1, -6, -8, -2, -5],
				vec![-1, -1, -1, -2, -3, -4],
				vec![-1, -9, -2, -4, -4, -5],
				vec![-7, -3, -3, -2, -9, -9],
				vec![-1, -3, -1, -2, -4, -5]
				],
				-6)]
    #[case(
			vec![
				vec![7, 6, 8, 2, 4, 3],
				vec![7, 3, 3, 0, 6, 1],
				vec![3, 8, 7, 7, 2, 2],
				vec![0, 8, 6, 8, 6, 1],
				vec![7, 1, 6, 0, 2, 4],
				vec![2, 7, 8, 1, 7, 4]
				],
				44)]
    #[case(
			vec![
				vec![3, 7, -3, 0, 1, 8],
				vec![1, -4, -7, -8, -6, 5],
				vec![-8, 1, 3, 3, 5, 7],
				vec![-2, 4, 3, 1, 2, 7],
				vec![2, 4, -5, 1, 8, 4],
				vec![5, -7, 6, 5, 2, 8]
				],
				33)]
    #[case(
			vec![
				vec![0, 6, -7, 1, 6, 3],
				vec![-8, 2, 8, 3, -2, 7],
				vec![-3, 3, -6, -3, 0, -6],
				vec![5, 0, 5, -1, -5, 2],
				vec![6, 2, 8, 1, 3, 0],
				vec![8, 5, 0, 4, -7, 4]
				],
				25)]
    #[case(
			vec![
				vec![0, -4, -6, 0, -7, -6],
				vec![-1, -2, -6, -8, -3, -1],
				vec![-8, -4, -2, -8, -8, -6],
				vec![-3, -1, -2, -5, -7, -4],
				vec![-3, -5, -3, -6, -6, -6],
				vec![-3, -6, 0, -8, -6, -7]
				],
				-19)]
    #[case(
			vec![
				vec![1, 1, 1, 0, 0, 0],
				vec![0, 1, 0, 0, 0, 0],
				vec![1, 1, 1, 0, 0, 0],
				vec![0, 0, 2, 4, 4, 0],
				vec![0, 0, 0, 2, 0, 0],
				vec![0, 0, 1, 2, 4, 0]
				],
				19)]
    #[case(
			vec![
				vec![-1, 1, -1, 0, 0, 0],
				vec![0, -1, 0, 0, 0, 0],
				vec![-1, -1, -1, 0, 0, 0],
				vec![0, -9, 2, -4, -4, 0],
				vec![-7, 0, 0, -2, 0, 0],
				vec![0, 0, -1, -2, -4, 0]
				],
				0)]

    fn test_hour_glass_sum(#[case] matrix: Vec<Vec<i32>>, #[case] expected: i32) {
        assert_eq!(hour_glass_sum(matrix), expected);
    }
}
