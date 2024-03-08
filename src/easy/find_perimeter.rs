pub fn find_perimeter(length: i32, width: i32) -> i32 {
    2 * (length + width)
}
#[cfg(test)]
mod tests {
    use super::find_perimeter;
    #[test]
    fn test_find_perimeter() {
        assert_eq!(find_perimeter(6, 7), 26);
        assert_eq!(find_perimeter(20, 10), 60);
        assert_eq!(find_perimeter(2, 9), 22);
    }
}
