func allLowercase(_ s: String) -> Bool {
  for c in s {
    if c.isUppercase {
      return false
    }
  }
  return true
}
func allUppercase(_ s: String) -> Bool {
  for c in s {
    if c.isLowercase {
      return false
    }
  }
  return true
}
func detectCapitalUse(_ word: String) -> Bool {
  if let first = word.first, first.isUppercase {
    return allLowercase(String(word.dropFirst(1))) || allUppercase(String(word.dropFirst(1)))
  }
  return allLowercase(word)
}
