pub fn maximum_toys(prices: &[i32], budget: i32) -> i32 {
    let mut sorted_prices = prices.to_vec();
    sorted_prices.sort();
    let mut total_spent = 0_i32;
    let mut toy_count = 0_i32;
    sorted_prices.sort();
    for price in sorted_prices {
        if total_spent + price > budget {
            break;
        }
        total_spent += price;
        toy_count += 1;
    }
    toy_count
}
#[cfg(test)]
mod tests {
    use super::maximum_toys;
    #[test]
    fn test_maximum_toys() {
        #[rustfmt::skip]
        assert_eq!(
            maximum_toys(
                &[ 33324560, 77661073, 31948330, 21522343, 97176507, 5724692, 24699815, 12079402, 6479353, 28430129, 42427721, 57127004, 26256001, 29446837, 65107604, 9809008, 65846182, 8470661, 13597655, 360 ],
                100_000
            ),
            1
        );
    }
}
