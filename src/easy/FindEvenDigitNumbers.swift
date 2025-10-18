func findEvenDigitNumbers(_ nums: [Int]) -> Int {
  var result = 0
  for num in nums {
    if String(num).count % 2 == 0 {
      result += 1
    }
  }
  return result
}
