pub fn sort_by_bits(arr: Vec<i32>) -> Vec<i32> {
    let mut result = arr;
    result.sort_by_key(|&x| (x.count_ones(), x));
    result
}
