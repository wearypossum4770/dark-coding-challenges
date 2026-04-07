func reverseWordsInString(_ s: String) -> String {
  return s.trimmingCharacters(in: .whitespaces)
    .components(separatedBy: .whitespaces)
    .filter { !$0.isEmpty }
    .reversed()
    .joined(separator: " ")

}
