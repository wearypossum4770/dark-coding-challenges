package easy

fun kodeeFinalPricesWithDiscount(prices: IntArray): IntArray {
    for (i in 0..<prices.size) {
        for (j in i + 1..<prices.size) {
            if (prices[j] <= prices[i]) {
                prices[i] -= prices[j]
                break
            }
        }
    }
    return prices
}
