pub fn rectangle_area(length: i32, width: i32) -> i32 {
    if length > 0 && width > 0 {
        return length * width;
    }
    -1
}
#[cfg(test)]
mod tests {
    use super::rectangle_area;
    #[test]
    fn test_rectangle_area() {
        assert_eq!(rectangle_area(5, 3), 15);
        assert_eq!(rectangle_area(8, 5), 40);
        assert_eq!(rectangle_area(5, 4), 20);
        assert_eq!(rectangle_area(2, 3), 6);
        assert_eq!(rectangle_area(10_000, 10_000), 100_000_000);
        assert_eq!(rectangle_area(-2, -5), -1);
        assert_eq!(rectangle_area(0, 3), -1);
        assert_eq!(rectangle_area(5, -3), -1);
        assert_eq!(rectangle_area(0, 1), -1);
        assert_eq!(rectangle_area(-1, 0), -1);
    }
}
