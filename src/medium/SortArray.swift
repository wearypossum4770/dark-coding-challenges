func sortArray(_ nums: [Int]) -> [Int] {
  guard !nums.isEmpty else {
    return []
  }
  var result = [Int]()
  result.reserveCapacity(nums.count)
  var index = 0
  var max = nums[0]
  var min = nums[0]
  var freq: [Int: Int] = [:]
  for num in nums {
    freq[num, default: 0] += 1
    if num < min { min = num }
    if num > max { max = num }
  }
  var i = min
  while i <= max {
    if let count = freq[i], count > 0 {
      result.append(contentsOf: Array(repeating: i, count: count))
    }
    i += 1
  }
  return result
}
