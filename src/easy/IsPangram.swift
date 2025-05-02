func isPangram(_ sentence: String) -> Bool {
  guard !sentence.isEmpty else { return false }
  var alphabet = Set("abcdefghijklmnopqrstuvwxyz")
  let cleaned = sentence.lowercased().filter { $0.isASCII && $0.isLetter }

  for char in cleaned {
    alphabet.remove(char)
    if alphabet.isEmpty { return true }
  }
  return false
}
