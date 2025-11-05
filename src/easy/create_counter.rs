#[derive(Default)]
pub struct Counter {
    pub initial: i32,
    pub count: i32,
}

impl Counter {
    fn new(num: i32) -> Self {
        Counter {
            initial: num,
            count: num,
        }
    }
    pub fn get_initial(&self) -> i32 {
        self.initial
    }
    pub fn get_count(&self) -> i32 {
        self.count
    }
}
pub fn create_counter(n: i32) -> impl FnMut() -> i32 {
    let mut counter = Counter::new(n);
    move || {
        let current = counter.count;
        counter.count += 1;
        current
    }
}
pub fn capture(nums: &mut Vec<i32>, index: usize, count: i32) {
    nums[index] = count;
}

#[cfg(test)]
mod tests {
    use super::{Counter, capture, create_counter};
    use rstest::rstest;
    #[rstest]
    #[case("Example 1: starting at 10 with 3 calls", 10, &["call", "call", "call"], &[10, 11, 12])]
    #[case("Example 2: starting at -2 with 5 calls", -2, &["call", "call", "call", "call", "call"], &[-2, -1, 0, 1, 2])]
    #[case("Edge Case 1: starting at 0 with no calls", 0, &[], &[])]
    #[case("Edge Case 2: single call from 1000", 1000, &["call"], &[1000])]
    #[case( "single call from zero", 0, &["call"], &[0])]
    #[case("Edge Case 3: starting at -1000 with 3 calls", -1000, &["call", "call", "call"], &[-1000, -999, -998])]
    #[case("lower bound near -1_000", -1_000, &["call", "call"], &[-1_000, -999])]
    #[case("upp bound near 1_000", 999, &["call", "call", "call"], &[999, 1_000, 1_001])]
    #[case("Edge Case 4: 1000 calls starting from 5", 5,   &vec!["call"; 1_000], &(0..1000).map(|i| 5 + i).collect::<Vec<i32>>())]
    #[case("mutliple increments (10 calls)", 3, &["call", "call", "call", "call", "call", "call", "call", "call", "call", "call"], &[3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ])]
    #[case("stress test (20 increments)", 42, &["call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call", "call"], &[42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61])]
    #[case("single call (simple check)", 7, &["call"], &[7])]
    #[case("midrange five calls", 100, &["call", "call", "call", "call", "call" ], &[100, 101, 102, 103, 104])]
    fn test_create_counter(
        #[case] _criteria: &str,
        #[case] n: i32,
        #[case] operations: &[&str],
        #[case] expected: &[i32],
    ) {
        let state = Counter::new(n);
        let mut result = create_counter(n);
        let mut actual = vec![0; operations.len()];
        operations
            .iter()
            .enumerate()
            .for_each(|(i, _)| capture(&mut actual, i, result()));
        assert_eq!(actual, expected.to_vec());
    }
}
