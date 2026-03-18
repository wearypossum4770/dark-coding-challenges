func processBackspaceCompare(_ text: String) -> String {
  var result: [Character] = []
  for c in text {
    if c == "#" {
      if !result.isEmpty {
        result.removeLast()
      }
    } else {
      result.append(c)
    }
  }
  return String(result)
}
func backspaceCompare(_ s: String, _ t: String) -> Bool {
  return processBackspaceCompare(s) == processBackspaceCompare(t)
}
