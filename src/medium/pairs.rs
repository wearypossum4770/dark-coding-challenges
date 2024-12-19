use std::collections::HashSet;
///@ HackerRank: [Pair Problem](https://www.hackerrank.com/challenges/pairs/problem)
///@
///@ #Return
///@ Returns an integer respresenting the pairs whose difference is within an absolute distance.
pub fn pairs(k: i32, arr: &[i32]) -> i32 {
    let mut count = 0_i32;
    let mut cache: HashSet<i32> = HashSet::new();

    for &num in arr {
        let total = num - k;
        if cache.contains(&(num - k)) {
            count += 1;
        }
        if cache.contains(&(num + k)) {
            count += 1;
        }
        cache.insert(num);
    }
    count
}
#[cfg(test)]
mod tests {
    use super::pairs;
    #[test]
    fn test_pairs() {
        assert_eq!(pairs(2, &[1, 5, 3, 4, 2]), 3);
        assert_eq!(
            pairs(
                1,
                &[
                    363374326, 364147530, 61825163, 1073065718, 1281246024, 1399469912, 428047635,
                    491595254, 879792181, 1069262793,
                ]
            ),
            0
        );
        assert_eq!(pairs(2, &[1, 3, 5, 8, 6, 4, 2]), 5);
    }
}
