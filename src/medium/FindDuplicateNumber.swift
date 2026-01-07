func findDisappearedNumbers(_ nums: [Int]) -> Int {
  var result = Array(repeating: 0, count: nums.count)
  for num in nums {
    if result[num - 1] > 0 {
      return num
    }
    result[num - 1] += 1
  }
  return 0
}
