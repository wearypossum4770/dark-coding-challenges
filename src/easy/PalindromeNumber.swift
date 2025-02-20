func palindromeNumber(_ x: Int) -> Bool {
  if x < 0 || (x % 10 == 0 && x != 0) {
    return false
  }
  let number = String(x)
  var left = number.startIndex
  var right = number.index(before: number.endIndex)
  while left < right {
    if number[left] != number[right] {
      return false
    }
    left = number.index(after: left)
    right = number.index(before: right)
  }
  return true
}
