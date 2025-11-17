func shuffleArrayToCoordinates(_ nums: [Int], _ n: Int) -> [Int] {
  var result = Array(repeating: 0, count: nums.count)
  for i in 0..<n {
    result[2 * i] = nums[i]
    result[2 * i + 1] = nums[i + n]
  }
  return result
}
