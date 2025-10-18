func plusOne(_ digits: [Int]) -> [Int] {
  var result = digits
  var index = digits.count - 1
  var remainder = 1
  while index >= 0 {
    let total = digits[index] + remainder
    if total <= 9 {
      result[index] = total
      return result
    }
    result[index] = 0
    index -= 1
    remainder = 1
  }
  if remainder > 0 {
    result.insert(1, at: 0)
  }
  return result
}
