pub fn valid_mountain_array(arr: Vec<i32>) -> bool {
    let n = arr.len();
    let mut i: usize = 0;
    while i + 1 < n && arr[i] < arr[i + 1] {
        i += 1;
    }
    if i == 0 || i == n - 1 {
        return false;
    }
    while i + 1 < n && arr[i] > arr[i + 1] {
        i += 1;
    }
    n.saturating_sub(1) == i
}
