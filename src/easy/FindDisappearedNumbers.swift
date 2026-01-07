func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: nums.count)
  for i in nums.indices {
    result[nums[i] - 1] = nums[i]
  }
  return result.enumerated().compactMap { (index, value) in
    value == 0 ? index + 1 : nil
  }
}
