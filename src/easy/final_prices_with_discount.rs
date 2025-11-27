pub fn final_prices_with_discount(prices: Vec<i32>) -> Vec<i32> {
    let mut result = prices.clone();
    for i in 0..result.len() {
        for j in i + 1..result.len() {
            if result[j] <= prices[i] {
                result[i] -= prices[j];
                break;
            }
        }
    }
    result
}