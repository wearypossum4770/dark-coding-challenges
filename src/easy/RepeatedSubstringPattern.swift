func repeatedSubstringPattern(_ s: String) -> Bool {
  if s.isEmpty {
    return true
  }
  let double = s + s
  return double.dropLast().dropFirst().contains(s)
}
