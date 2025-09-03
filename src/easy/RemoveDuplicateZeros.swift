func removeDuplicateZeros(_ arr: inout [Int]) {
  let right = arr.count - 1
  var left = 0
  while left <= right {
    var r = right
    if arr[left] == 0 {
      while r > left {
        arr[r] = arr[r - 1]
        r -= 1
      }
      left += 1
    }
    left += 1
  }
}
