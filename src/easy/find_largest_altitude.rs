pub fn find_largest_altitude(gain: Vec<i32>) -> i32 {
    let mut result = vec![0; gain.len() + 1];
    let mut altitude: i32 = 0;
    gain.into_iter().enumerate().for_each(|(i, num)| {
        result[i] = num + altitude;
        altitude += num;
    });
    match result.into_iter().max() {
        Some(largest) => largest,
        None => 0,
    }
}