pub fn number_squared(num: i32) -> i32 {
    i32::pow(num, 2)
}
#[cfg(test)]
mod tests {
    use super::number_squared;
    #[test]
    fn test_number_squared() {
        assert_eq!(number_squared(10), 100,);
        assert_eq!(number_squared(69), 4761,);
        assert_eq!(number_squared(666), 443556,);
        assert_eq!(number_squared(-21), 441,);
        assert_eq!(number_squared(21), 441,);
    }
}
