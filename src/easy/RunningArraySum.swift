func runningArraySum(_ nums: [Int]) -> [Int] {
  var result: [Int] = Array(repeating: 0, count: nums.count)
  for i in nums.indices {
    if i == 0 {
      result[i] = nums[i]
    } else {
      result[i] = result[i - 1] + nums[i]
    }
  }
  return result
}
