func check(_ word: String) -> Bool {
  var left = word.startIndex
  var right = word.index(before: word.endIndex)
  while left < right {
    if word[left] != word[right] {
      return false
    }
    left = word.index(after: left)
    right = word.index(before: right)
  }
  return true
}
func findFirstPalindrome(_ words: [String]) -> String {
  for word in words {
    if check(word) {
      return word
    }
  }

  return ""
}
