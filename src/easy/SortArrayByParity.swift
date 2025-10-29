func sortArrayByParity(_ nums: inout [Int]) -> [Int] {
  var left = 0
  var right = nums.count - 1
  while left < right {
    if nums[left] % 2 == 0 {
      left += 1
    } else if nums[right] % 2 == 1 {
      right -= 1
    } else {
      nums.swapAt(left, right)
      right -= 1
      left += 1
    }
  }

  return nums
}
