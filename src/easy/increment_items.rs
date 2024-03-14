pub fn increment_items(items: &[i16]) -> Vec<i16> {
    items.iter().map(|x| x + 1).collect::<Vec<i16>>()
}
#[cfg(test)]
mod tests {
    use super::increment_items;
    #[test]
    fn test_increment_items() {
        assert_eq!(increment_items(&[0, 1, 2, 3]), [1, 2, 3, 4].to_vec());
        assert_eq!(increment_items(&[2, 4, 6, 8]), [3, 5, 7, 9].to_vec());
        assert_eq!(increment_items(&[-1, -2, -3, -4]), [0, -1, -2, -3].to_vec());
    }
}
