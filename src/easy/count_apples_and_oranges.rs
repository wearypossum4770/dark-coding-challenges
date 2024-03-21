fn count_fruit(start: i16, end: i16, tree: i16, basket: &[i16]) -> i16 {
    let mut count: i16 = 0;
    for fruit in basket {
        let distance = tree + *fruit as i16;
        if start <= distance && end >= distance {
            count += 1;
        }
    }
    count
}
pub fn count_apples_and_oranges(
    s: i16,
    t: i16,
    a: i16,
    b: i16,
    _m: i16,
    _n: i16,
    apples: &[i16],
    oranges: &[i16],
) -> [i16; 2] {
    [count_fruit(s, t, a, apples), count_fruit(s, t, b, oranges)]
}
#[cfg(test)]
mod tests {
    use super::count_apples_and_oranges;
    #[test]
    fn test_count_apples_and_oranges() {
        assert_eq!(
            count_apples_and_oranges(7, 10, 4, 12, 0, 0, &[2, 3, -4], &[3, -2, -4]),
            [1, 2]
        );
        assert_eq!(
            count_apples_and_oranges(7, 11, 5, 15, 3, 2, &[-2, 2, 1], &[5, -6]),
            [1, 1]
        );
        assert_eq!(
            count_apples_and_oranges(2, 3, 1, 5, 1, 1, &[-2], &[-1]),
            [0, 0]
        );
        assert_eq!(
            count_apples_and_oranges(2, 3, 1, 5, 1, 1, &[2], &[-2]),
            [1, 1]
        );
    }
}
