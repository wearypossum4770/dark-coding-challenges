pub fn replace_greatest_elements(arr: &mut Vec<i32>) -> Vec<i32> {
    let mut max: i32 = -1;
    let mut right: usize = arr.len();
    while right > 0 {
        right -= 1;
        let temp = arr[right];
        arr[right] = max;
        if temp > max {
            max = temp;
        }
    }

    arr.to_vec()
}