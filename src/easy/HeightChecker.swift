func heightChecker(_ nums: [Int]) -> Int {
  var count = 0
  var arr = Array(nums)
  arr.sort(by: <)
  for i in nums.indices {
    if arr[i] != nums[i] {
      count += 1
    }
  }
  return count
}
