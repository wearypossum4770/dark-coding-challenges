func findErrorNums(_ nums: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: nums.count)
  var target = [0, 0]
  for n in nums {
    if result[n - 1] > 0 {
      target[0] = n
    } else {
      result[n - 1] = n
    }
  }
  for (i, n) in result.enumerated() {
    if n == 0 {
      target[1] = i + 1
    }
  }
  return target
}
