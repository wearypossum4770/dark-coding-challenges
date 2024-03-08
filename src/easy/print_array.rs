pub fn print_array(size: usize) -> Vec<u8> {
    let mut target = Vec::with_capacity(size);
    for num in (1..=size) {
        target.push(num.try_into().unwrap());
    }
    target
}
#[cfg(test)]
mod tests {
    use super::print_array;
    #[test]
    fn test_print_array() {
        assert_eq!(print_array(1), [1].to_vec());
        assert_eq!(print_array(2), [1, 2].to_vec());
        assert_eq!(print_array(3), [1, 2, 3].to_vec());
        assert_eq!(print_array(4), [1, 2, 3, 4].to_vec());
        assert_eq!(print_array(5), [1, 2, 3, 4, 5].to_vec());
        assert_eq!(print_array(6), [1, 2, 3, 4, 5, 6].to_vec());
        assert_eq!(print_array(7), [1, 2, 3, 4, 5, 6, 7].to_vec());
        assert_eq!(print_array(8), [1, 2, 3, 4, 5, 6, 7, 8].to_vec());
        assert_eq!(print_array(9), [1, 2, 3, 4, 5, 6, 7, 8, 9].to_vec());
        assert_eq!(print_array(10), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].to_vec());
    }
}
