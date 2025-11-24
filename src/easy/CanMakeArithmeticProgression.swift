func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
  let nums = arr.sorted()
  var index = 1
  while index < nums.count - 1 {
    if nums[index] - nums[index + 1] != nums[0] - nums[1] {
      return false
    }
    index += 1
  }
  return true
}
