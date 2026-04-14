func maxStockProfit(_ prices: [Int]) -> Int {
  var minPrice = prices[0]
  var maxProfit = minPrice - minPrice
  for price in prices {
    minPrice = min(minPrice, price)
    maxProfit = max(maxProfit, price - minPrice)
  }
  return maxProfit
}
