pub fn simple_array_sum(sample: &[i32]) -> i32 {
    sample.iter().fold(0, |acc, curr| acc + curr)
}
#[cfg(test)]
mod tests {
    use super::simple_array_sum;
    #[test]
    fn test_simple_array_sum() {
        assert_eq!(simple_array_sum(&[1, 2, 3, 4, 10, 11]), 31);
    }
}
