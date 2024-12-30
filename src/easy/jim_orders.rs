/// [Hacker Rank](https://www.hackerrank.com/challenges/jim-and-the-orders/problem)
///
pub fn jim_orders(orders: &[Vec<i32>]) -> Vec<i32> {
    let mut completion: Vec<(i32, i32)> = Vec::with_capacity(orders.len());
    for (index, order) in orders.iter().enumerate() {
        let delivery = order[0] + order[1];
        let prep = index as i32 + 1; // 1-based index
        completion.push((delivery, prep));
    }

    completion.sort_by(|a, b| a.0.cmp(&b.0).then_with(|| a.1.cmp(&b.1)));
    completion.into_iter().map(|(_, prep)| prep).collect()
}
#[cfg(test)]
mod tests {
    use super::jim_orders;
    #[test]
    fn test_jim_orders() {
        assert_eq!(
            jim_orders(&vec![vec![8, 1], vec![4, 2], vec![5, 6], vec![3, 1]]),
            vec![4, 2, 1, 3]
        );
    }
    #[test]
    fn test_single_order() {
        // Arrange
        let orders = vec![vec![1, 1]];
        // Act
        let result = jim_orders(&orders);
        // Assert
        assert_eq!(result, vec!(1));
    }
    #[test]
    fn test_distinct_completion_times() {
        let orders = vec![vec![1, 1], vec![2, 2], vec![3, 3]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
    #[test]
    fn test_tied_completion_times() {
        let orders = vec![vec![1, 2], vec![2, 1], vec![1, 2]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
    #[test]
    fn test_large_total_times() {
        let orders = vec![vec![1_000_000, 2_000_000], vec![2_000_000, 1_000_000]];
        assert_eq!(jim_orders(&orders), vec![1, 2]);
    }
    #[test]
    fn test_mixed_zero_times() {
        let orders = vec![vec![0, 0], vec![1, 0], vec![0, 1]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
    #[test]
    fn test_descending_completion_times() {
        let orders = vec![vec![3, 3], vec![2, 2], vec![1, 1]];
        assert_eq!(jim_orders(&orders), vec![3, 2, 1]);
    }
    #[test]
    fn test_all_orders_same_time() {
        let orders = vec![vec![1, 1], vec![1, 1], vec![1, 1]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
    #[test]
    fn test_large_number_of_orders() {
        let orders = (1..=100_000).map(|i| vec![i, i]).collect::<Vec<Vec<i32>>>();
        assert_eq!(jim_orders(&orders), (1..=100_000).collect::<Vec<i32>>());
    }
    #[test]
    fn test_min_input_values() {
        let orders = vec![vec![0, 0], vec![0, 0], vec![0, 0]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
    #[test]
    fn test_max_input_values() {
        let orders = vec![
            vec![1_000_000, 1_000_000],
            vec![1_000_000, 0],
            vec![0, 1_000_000],
        ];
        assert_eq!(jim_orders(&orders), vec![2, 3, 1]);
    }
    #[test]
    fn test_non_sequential_indices() {
        let orders = vec![vec![3, 3], vec![1, 1], vec![2, 2]];
        assert_eq!(jim_orders(&orders), vec![2, 3, 1]);
    }
    #[test]
    fn test_min_max_input_values() {
        let orders = vec![vec![0, 0], vec![i32::MAX, 0], vec![0, i32::MAX]];
        assert_eq!(jim_orders(&orders), vec![1, 2, 3]);
    }
}

// zDPyCV:bE2FxN67
