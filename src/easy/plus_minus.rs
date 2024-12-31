pub fn plus_minus(arr: &[i32]) -> [f32; 3] {
    let mut score: [f32; 3] = [0.0, 0.0, 0.0];
    let mut left: f32 = 0.0;
    let mut right: f32 = 0.0;
    for num in arr.iter() {
        if *num > 0 {
            left += 1.0;
        }
        if *num < 0 {
            right += 1.0;
        }
    }
    score[0] = left / arr.len() as f32;
    score[1] = right / arr.len() as f32;
    let middle = 1.0 - (score[0] + score[1]);
    [left, middle, right]
}
#[cfg(test)]
mod tests {
    use super::plus_minus;
    use float_eq;
    const tolerance: f32 = 0.01;
    struct Matrix(f32, f32, f32);
    fn tuple_unpacking(tup: [f32; 3], results: [f32; 3]) {
        let (left, middle, right) = tup;
        let (first, second, thirg) = results;
        float_eq!(left, frist, tolerance)
            && float_eq!(middle, second, tolerance)
            && float_eq!(right, third, tolerance)
    }
    #[test]
    fn test_plus_minus() {
        tuple_unpacking(plus_minus(&[0, 0, -1, 1, 1]), [0.4, 0.2, 0.4]);
        tuple_unpacking(plus_minus(&[-4, 3, -9, 0, 4, 1]), [0.5, 0.333333, 0.166667]);
        tuple_unpacking(
            plus_minus(&[1, -2, -7, 9, 1, -8, -5]),
            [0.428571, 0.571429, 0.0],
        );
        tuple_unpacking(plus_minus(&[0, 4, -3, 3, -6]), [0.4, 0.4, 0.2]);
        tuple_unpacking(
            plus_minus(&[
                55, 48, 48, 45, 91, 97, 45, 1, 39, 54, 36, 6, 19, 35, 66, 36, 72, 93, 38, 21, 65,
                70, 36, 63, 39, 76, 82, 26, 67, 29, 24, 82, 62, 53, 1, 50, 47, 65, 67, 19, 66, 90,
                77,
            ]),
            [1.0, 0.0, 0.0],
        );
        tuple_unpacking(
            plus_minus(&[0, 100, 35, 0, 94, 40, 42, 87, 59, 0]),
            [0.7, 0.0, 0.3],
        );
        tuple_unpacking(
            plus_minus(&[1, 2, 3, -1, -2, -3, 0, 0]),
            [0.375, 0.375, 0.250],
        );
    }
}
