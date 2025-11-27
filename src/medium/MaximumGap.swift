func maximumGap(_ nums: [Int]) -> Int {
  if nums.count < 2 {
    return 0
  }
  let sorted = nums.sorted()
  var result = sorted[1] - sorted[0]
  for i in 1..<sorted.count - 1 {
    result = max(result, sorted[i + 1] - sorted[i])
  }

  return result
}
