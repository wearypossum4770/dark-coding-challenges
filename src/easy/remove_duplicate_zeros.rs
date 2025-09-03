pub fn remove_duplicate_zeros(arr: &mut Vec<i32>) {
    let mut left = 0;
    let right = arr.len() - 1;
    while left <= right {
        let mut r = right;
        if arr[left] == 0 {
            while r > left {
                arr[r] = arr[r - 1];
                r -= 1;
            }
            left += 1;
        }
        left += 1;
    }
}
