func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
  var count = 0
  for index in nums.indices {
    if nums[index] != val {
      nums[count] = nums[index]
      count += 1
    }
  }
  return count
}
