func removeArrayDuplicates(_ nums: inout [Int]) -> Int {
  var count = 0
  for i in 0..<nums.count {
    if nums[count] != nums[i] {
      count += 1
      nums[count] = nums[i]
    }
  }
  return count + 1
}
