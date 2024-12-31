/// [Hacker Rank](https://www.hackerrank.com/challenges/sherlock-and-array/problem)
pub fn balanced_sums(arr: &[i32]) -> &str {
    let mut left = 0_i32;
    let mut right = arr.iter().fold(0, |acc, x| acc + x);
    for num in arr {
        right -= num;
        if left == right {
            return "YES";
        };
        left += num;
    }
    "NO"
}
#[cfg(test)]
mod tests {
    use super::balanced_sums;
    #[test]
    fn test_no_balanced_sums() {
        assert_eq!(balanced_sums(&[1, 2, 3]), "NO");
    }
    #[test]
    fn test_balanced_sums_non_unique_values() {
        assert_eq!(balanced_sums(&[1, 2, 3, 3]), "YES");
    }
    #[test]
    fn test_sample_case() {
        assert_eq!(balanced_sums(&[5, 6, 8, 11]), "YES");
    }
    #[test]
    fn test_long_sample_case() {
        let parameter = [
            185, 170, 208, 216, 236, 155, 88, 206, 211, 209, 84, 99, 130, 245, 232, 125, 127, 232,
            187, 140, 92, 213, 221, 231, 129, 197, 221, 168, 95, 186, 136, 180, 94, 125, 150, 244,
            249, 248, 140, 207, 125, 84, 123, 85, 100, 175, 67, 116, 107, 143, 158, 75, 165, 172,
            115, 134, 175, 123, 115, 123, 159, 181, 63, 176, 158, 109, 67, 154, 126, 141, 111, 95,
            138, 161, 71, 118, 151, 189, 126, 109, 194, 176, 159, 151, 189, 71, 95, 133, 154, 157,
            109, 78, 101, 174, 169, 152, 94, 193, 176, 137,
        ];

        assert_eq!(balanced_sums(&parameter), "YES");
    }
    #[test]
    fn test_balanced_sum_amalgamation() {
        assert_eq!(balanced_sums(&[1, 2, 3]), "NO");
        assert_eq!(balanced_sums(&[1, 2, 3, 3]), "YES");
        assert_eq!(balanced_sums(&[1]), "YES");
        assert_eq!(balanced_sums(&[]), "NO");
        assert_eq!(balanced_sums(&[0]), "YES");
        assert_eq!(balanced_sums(&[1, 1, 1, 1, 1]), "YES");
        assert_eq!(balanced_sums(&[5, 5, 5]), "YES");
        assert_eq!(balanced_sums(&[5, 5, 5, 5]), "NO");
        assert_eq!(balanced_sums(&[2, 0, 0, 0]), "YES");
        assert_eq!(balanced_sums(&[0, 0, 0, 2]), "YES");
        assert_eq!(balanced_sums(&[1, 2, 3, 3]), "YES");
        assert_eq!(balanced_sums(&[-1, -2, -3, -4, -1]), "NO");
        assert_eq!(balanced_sums(&[-2, -3, 10, -3, -2]), "YES");
        assert_eq!(balanced_sums(&[1, -1, 0]), "YES");
        assert_eq!(balanced_sums(&[-1, -1, 2]), "NO");
        assert_eq!(balanced_sums(&[1_000_000, 0, 1_000_000]), "YES");
        assert_eq!(balanced_sums(&[999999, 999999, 999999, 999999]), "NO");
        assert_eq!(balanced_sums(&[5, 6, 8, 11]), "YES");
        assert_eq!(balanced_sums(&[1, 2, 3, 4, 6]), "YES");
        assert_eq!(balanced_sums(&[0, 0, 0, 0]), "YES");
        assert_eq!(balanced_sums(&[0, 0, 1, 0]), "YES");
        assert_eq!(balanced_sums(&[2, 0, 0, 0, 2]), "YES");
        assert_eq!(balanced_sums(&[1, 1, 4, 1, 1]), "YES");
        assert_eq!(balanced_sums(&[20, 10, 30, 10, 20]), "YES");
        assert_eq!(balanced_sums(&[10, 10, 10, 30, 10, 10, 10]), "YES");
        assert_eq!(balanced_sums(&[0, 0, 0, 0]), "YES");
        assert_eq!(balanced_sums(&[10, 20, 30, 40]), "NO");
        assert_eq!(balanced_sums(&[1, 1, 1, 3, 1, 1, 1]), "YES");
        assert_eq!(balanced_sums(&[10, 0, 0]), "YES");
    }
}
