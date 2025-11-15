func frequencySort(_ s: String) -> String {
  var freq: [Character: Int] = [:]
  for char in s {
    freq[char, default: 0] += 1
  }
  var result = ""
  for (char, count) in freq.sorted(by: { $0.value > $1.value }) {
    result += String(repeating: char, count: count)
  }

  return result
}
