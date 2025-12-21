pub fn min_deletion_size(strs: Vec<String>) -> i32 {
    let mut count: i32 = 0;
    let rows = strs.len();
    let cols = strs[0].len();
    let bytes: Vec<&[u8]> = strs.iter().map(|s| s.as_bytes()).collect();

    for col in 0..cols {
        let mut row = 1;
        while row < rows {
            if bytes[row - 1][col] > bytes[row][col] {
                count += 1;
                break;
            }
            row += 1;
        }
    }
    count
}
