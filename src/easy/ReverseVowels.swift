func isVowel(_ c: Character) -> Bool {
  switch c.lowercased() {
    case "a", "e", "i", "o", "u":
      return true
    default:
      return false
  }
}

func reverseVowels(_ s: String) -> String {
  var result = Array(s)
  var left = 0
  var right = result.count - 1
  while left <= right {
    if !isVowel(result[left]) {
      left += 1
      continue
    }
    if !isVowel(result[right]) {
      right -= 1
      continue
    }
    result.swapAt(left, right)
    left += 1
    right -= 1
  }

  return String(result)
}
