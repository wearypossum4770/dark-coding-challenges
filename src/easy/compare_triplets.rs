pub fn compare_triplets(alice: [u8; 3], bob: [u8; 3]) -> [u8; 2] {
    let mut score: [u8; 2] = [0, 0];
    for (outdex, outer) in alice.iter().enumerate() {
        if alice[outdex] > bob[outdex] {
            score[0] += 1;
        } else if alice[outdex] < bob[outdex] {
            score[1] += 1;
        }
    }
    score
}
#[cfg(test)]
mod tests {
    use super::compare_triplets;
    #[test]
    fn test_compare_triplets() {
        assert_eq!(compare_triplets([5, 6, 7], [3, 6, 10]), [1, 1]);
        assert_eq!(compare_triplets([1, 2, 3], [1, 2, 3]), [0, 0]);
        assert_eq!(compare_triplets([6, 8, 12], [7, 9, 15]), [0, 3]);
        assert_eq!(compare_triplets([10, 15, 20], [5, 6, 7]), [3, 0]);
        assert_eq!(compare_triplets([10, 12, 50], [20, 20, 10]), [1, 2]);
        assert_eq!(compare_triplets([10, 20, 30], [5, 5, 50]), [2, 1]);
        assert_eq!(compare_triplets([20, 20, 30], [20, 20, 50]), [0, 1]);
        assert_eq!(compare_triplets([17, 28, 30], [99, 16, 8]), [2, 1]);
    }
}
