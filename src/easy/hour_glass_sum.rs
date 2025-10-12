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