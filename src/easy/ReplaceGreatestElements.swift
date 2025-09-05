func replaceGreatestElements(_ arr: inout [Int]) -> [Int] {
  var max = -1
  var right = arr.count - 1
  while right >= 0 {
    let temp = arr[right]
    arr[right] = max
    if temp > max {
      max = temp
    }
    right -= 1
  }
  return arr
}
