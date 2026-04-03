func longestPalindrome(_ s: String) -> Int {
  var freq = [Character: Int]()
  for char in s {
    freq[char, default: 0] += 1
  }
  let odds = freq.values.filter { $0 % 2 != 0 }.count

  if odds > 1 {
    return s.count - odds + 1
  }
  return s.count
}
