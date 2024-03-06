pub fn array_pop(array: &[i32]) -> i32 {
    array[0]
}
#[cfg(test)]
mod tests {
    use super::array_pop;
    #[test]
    fn test_array_pop() {
        assert_eq!(array_pop(&[1, 2, 3]), 1);
        assert_eq!(array_pop(&[80, 5, 100]), 80);
        assert_eq!(array_pop(&[-500, 0, 50]), -500);
        assert_eq!(array_pop(&[5, 2, 3]), 5);
        assert_eq!(array_pop(&[75675, 5, 100]), 75675);
        assert_eq!(array_pop(&[-52320, 0, 50]), -52320);
    }
}
