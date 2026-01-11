pub fn max_ice_cream(costs: Vec<i32>, coins: i32) -> i32 {
    let mut cones: i32 = 0;
    let mut remaining = coins;
    let mut arr = costs;
    arr.sort();
    for &n in arr.iter() {
        if remaining >= n {
            remaining -= n;
            cones += 1;
        }
    }
    cones
}

#[cfg(test)]
mod tests {
    use super::max_ice_cream;
    use rstest::rstest;
    #[rstest]
    #[case(&[1, 3, 2, 4, 1], 7, 4)]
    #[case(&[10, 6, 8, 7, 7, 8], 5, 0)]
    #[case(&[1, 6, 3, 1, 2, 5], 20, 6)]
    #[case(&[1, 3, 2, 4, 1], 7, 4)]
    #[case(&[1, 3, 2, 4, 1], 10, 4)]
    #[case(&[10, 6, 8, 7, 7, 8], 5, 0)]
    #[case(&[1, 6, 3, 1, 2, 5], 20, 6)]
    #[case(&[1, 6, 3, 1, 2, 5], 18, 6)]
    #[case(&[1, 6, 3, 1, 2, 5], 17, 5)]
    #[case(&[1], 0, 0)]
    #[case(&[1], 1, 1)]
    #[case(&[100000], 99999, 0)]
    #[case(&[100000], 100000, 1)]
    #[case(&[], 100, 0)]
    #[case(&[2, 2, 2, 2, 2], 9, 4)]
    #[case(&[2, 2, 2, 2, 2], 10, 5)]
    #[case(&[1, 1, 1, 1, 1], 3, 3)]
    #[case(&[27,23,33,26,46,86,70,85,89,82,57,66,42,18,18,5,46,56,42,82,52,78,4,27,96,74,74,52,2,24,78,18,42,10,12,10,80,30,60,38,32,7,98,26,18,62,50,42,15,14,32,86,93,98,47,46,58,42,74,69,51,53,58,40,66,46,65,2,10,82,94,26,6,78,2,101,97,16,12,18,71,5,46,22,58,12,18,62,61,51,2,18,34,12,36,58,20,12,17,70], 241, 24)]
    fn test_max_ice_cream(#[case] costs: &[i32], #[case] coins: i32, #[case] expected: i32) {
        assert_eq!(max_ice_cream(costs.to_vec(), coins), expected);
    }
}
