pub fn count_interval_range_odds(low: i32, high: i32) -> i32 {
    (high + 1).div_euclid(2) - low.div_euclid(2)
}
