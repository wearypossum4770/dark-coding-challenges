func secondLargest(_ arr: [Int]) -> Int {
  let nums = Set(arr)
  var first = Int.min
  var second = Int.min
  for num in nums {
    if first < num {
      second = first
      first = num
    }
    if second < first && first > num {
      second = num
    }
  }
  return second
}
