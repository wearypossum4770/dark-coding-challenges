
pub fn triangle_area(base: i32, height: i32) -> i32 {
    (base * height) / 2
}
#[cfg(test)]
mod tests {
    use super::triangle_area;
    #[test]
    fn test_triangle_area() {
        assert_eq!(triangle_area(3, 2), 3);
        assert_eq!(triangle_area(5, 4), 10);
        assert_eq!(triangle_area(10, 10), 50);
        assert_eq!(triangle_area(0, 60), 0);
        assert_eq!(triangle_area(12, 11), 66);
    }
}
