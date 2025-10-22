func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
  var count = fruits.count
  var replaced = Array(repeating: false, count: baskets.count)
  for fruit in fruits {
    for (i, basket) in baskets.enumerated() {
      if basket >= fruit && !replaced[i] {
        replaced[i] = true
        count -= 1
        break
      }
    }
  }
  return count
}
