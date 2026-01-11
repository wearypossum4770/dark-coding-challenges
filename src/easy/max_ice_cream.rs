pub fn max_ice_cream(costs: Vec<i32>, coins: i32) -> i32 {
    let mut cones: i32 = 0;
    let mut remaining = coins;
    let mut arr = costs;
    arr.sort();
    for &n in arr.iter() {
        if remaining >= n {
            remaining -= n;
            cones += 1;
        }
    }
    cones
}
