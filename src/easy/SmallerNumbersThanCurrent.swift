func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: nums.count)
  for i in 0..<nums.count {
    for j in 0..<nums.count {
      if nums[i] > nums[j] {
        result[i] += 1
      }
    }
  }
  return result
}
