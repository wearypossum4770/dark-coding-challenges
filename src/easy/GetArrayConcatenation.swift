func getArrayConcatenation(_ nums: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: 2 * nums.count)
  for (i, num) in nums.enumerated() {
    result[i] = num
    result[i + nums.count] = num
  }

  return result
}
