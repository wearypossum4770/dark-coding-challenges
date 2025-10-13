func stringIntegerIsBalanced(_ num: String) -> Bool {
  var odd = 0
  var even = 0
  for (i, c) in num.enumerated() {
    let digit = c.wholeNumberValue ?? 0
    if i % 2 == 0 {
      even += digit
    } else {
      odd += digit
    }
  }
  return odd == even
}
