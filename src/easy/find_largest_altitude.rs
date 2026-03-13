pub fn find_largest_altitude(gain: Vec<i32>) -> i32 {
    let mut result = vec![0; gain.len() + 1];
    let mut altitude: i32 = 0;
    gain.into_iter().enumerate().for_each(|(i, num)| {
        result[i] = num + altitude;
        altitude += num;
    });
    match result.into_iter().max() {
        Some(largest) => largest,
        None => 0,
    }
}
#[cfg(test)]
mod tests {
    use super::find_largest_altitude;
    use rstest::rstest;
    #[rstest]
    #[case(&[-5, 1, 5, 0, -7], 1)]
    #[case(&[-4, -3, -2, -1, 4, 3, 2], 0)]
    #[case(&[0], 0)]
    #[case(&[100], 100)]
    #[case(&[-100], 0)]
    #[case(&[1], 1)]
    #[case(&[0, 0, 0, 0], 0)]
    #[case(&[1, 2, 3, 4, 5], 15)]
    #[case(&[-1, -2, -3, -4, -5], 0)]
    #[case(&[5, 5, 5, 5], 20)]
    #[case(&[-5, -5, -5, -5], 0)]
    #[case(&[10, -20, 10], 10)]
    #[case(&[1, 1, 1, 1, -100], 4)]
    #[case(&[-100, 1, 1, 1, 1], 0)]
    #[case(&[50, -100, 50, -100, 50], 50)]
    #[case(&[100, -100, -100, -100], 100)]
    #[case(&[-1, -1, -1, 1, 1], 0)]
    #[case(&[1, -1, 1, -1, 1, -1], 1)]
    #[case(&[1, 1, 1, 1, 1], 5)]
    #[case(&[-100], 0)]
    #[case(&[100], 100)]
    fn test_find_largest_altitude(#[case] gain: &[i32], #[case] expected: i32) {
        assert_eq!(find_largest_altitude(gain.to_vec()), expected);
    }
}
