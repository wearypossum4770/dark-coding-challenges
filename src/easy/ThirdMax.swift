func thirdMax(_ nums: [Int]) -> Int {
  let unique = Set(nums)
  var first = -(1 << 53) + 1
  var second = first
  var third = first
  for n in unique {
    if first < n {
      third = second
      second = first
      first = n
    } else if second < n {
      third = second
      second = n
    } else if third < n {
      third = n
    }
  }
  if unique.count < 3 {
    return first
  }
  return third
}
