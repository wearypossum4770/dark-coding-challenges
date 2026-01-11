func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
  var cones = 0
  var arr = costs
  var remaining = coins
  arr.sort()
  for cost in arr {
    if cost > remaining {
      break
    }
    remaining -= cost
    cones += 1

  }
  return cones
}
