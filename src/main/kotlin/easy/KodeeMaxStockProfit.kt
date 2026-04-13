package easy
import kotlin.math.max
import kotlin.math.min

fun kodeeMaxStockProfit(prices: IntArray): Int {
    var top = 0
    var minPrice = prices[0]
    for (price in prices) {
        minPrice = min(price, minPrice)
        top = max(top, price - minPrice)
    }
    return top
}
