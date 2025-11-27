func finalPricesWithDiscount(_ prices: [Int]) -> [Int] {
  var result = Array(prices)
  for i in 0..<result.count {
    for j in i + 1..<result.count {
      if prices[j] <= prices[i] {
        result[i] = prices[i] - prices[j]
        break
      }
    }
  }
  return result
}
