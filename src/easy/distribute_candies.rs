use std::collections::HashSet;

pub fn distribute_candies(candy_type: Vec<i32>) -> i32 {
    let unique = candy_type.iter().collect::<HashSet<_>>();
    std::cmp::min(unique.len() as i32, (candy_type.len() / 2) as i32)
}
#[cfg(test)]
mod tests {
    use super::distribute_candies;
    use rstest::rstest;
    #[rstest]
    #[case("3 unique, can eat 3", &[1, 1, 2, 2, 3, 3], 3)]
    #[case("3 unique, can eat 2", &[1, 1, 2, 3], 2)]
    #[case("1 unique, can eat 2 -> only 1 type", &[6, 6, 6, 6], 1)]
    #[case("6 unique, can eat 3", &[1, 2, 3, 4, 5, 6], 3)]
    #[case("1 unique", &[1, 1], 1)]
    #[case("no candies can't eay any", &[], 0)]
    #[case("<constraint non-conforming> 1 unique, 1 count cannot eat", &[1], 0)]
    #[case("2 unique, can eat 1", &[1, 2], 1)]

    fn test_distribute_candies(
        #[case] _criteria: &str,
        #[case] candy_type: &[i32],
        #[case] expected: i32,
    ) {
        assert_eq!(distribute_candies(candy_type.to_vec()), expected);
    }
    #[test]
    fn test_all_unique() {
        let input: Vec<i32> = (0..100).collect();
        // can eat half (100 / 2 = 50)
        assert_eq!(distribute_candies(input), 50);
    }

    #[test]
    fn test_all_same() {
        let input = vec![5; 10];
        // only 1 type
        assert_eq!(distribute_candies(input), 1);
    }
    #[test]
    fn test_large_input() {
        // mix of duplicates and uniques
        let mut input = Vec::new();
        for i in 0..1000 {
            input.push(i);
            input.push(i); // duplicates
        }
        // 1000 unique, can eat 1000
        let result = distribute_candies(input);
        assert_eq!(result, 1000);
    }
}
