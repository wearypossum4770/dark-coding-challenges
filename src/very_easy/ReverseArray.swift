func reverseArray(_ arr: [Int]) -> [Int] {
  if arr.count < 1 { return arr }
  var temp: [Int] = arr
  temp.reverse()
  return temp
}
