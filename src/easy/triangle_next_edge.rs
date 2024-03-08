pub fn triangle_next_edge(a: i32, b: i32) -> i32 {
    a + b - 1
}
#[cfg(test)]
mod tests {
    use super::triangle_next_edge;
    #[test]
    fn test_triangle_next_edge() {
        assert_eq!(triangle_next_edge(5, 4), 8);
        assert_eq!(triangle_next_edge(8, 3), 10);
        assert_eq!(triangle_next_edge(7, 9), 15);
        assert_eq!(triangle_next_edge(10, 4), 13);
        assert_eq!(triangle_next_edge(7, 2), 8);
    }
}
