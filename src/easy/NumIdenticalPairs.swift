func numIdenticalPairs(_ nums: [Int]) -> Int {
  var count = 0
  var left = 0
  while left < nums.count {
    var right = left + 1
    while right < nums.count {
      if nums[left] == nums[right] {
        count += 1
      }
      right += 1
    }
    left += 1
  }
  return count
}
