func minimumAbsoluteDifference(_ arr: [Int]) -> [[Int]] {
  if arr.count < 2 { return [] }
  var result = [[Int]]()
  let nums = arr.sorted()
  var min: Int = Int.max

  for i in 0..<nums.count - 1 {
    let diff = nums[i + 1] - nums[i]
    if min > diff {
      min = diff
      result = [[nums[i], nums[i + 1]]]
    } else if min == diff {
      result.append([nums[i], nums[i + 1]])
    }
  }
  return result
}
