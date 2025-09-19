func canConstructRansomNote(_ ransomNote: String, _ magazine: String) -> Bool {
  var freq = Array(repeating: 0, count: 26)

  for char in magazine.lowercased() {
    if let ascii = char.asciiValue, ascii >= 97 && ascii <= 122 {
      freq[Int(ascii - 97)] += 1
    }
  }

  for char in ransomNote.lowercased() {
    if let ascii = char.asciiValue, ascii >= 97 && ascii <= 122 {
      freq[Int(ascii - 97)] -= 1
      if freq[Int(ascii - 97)] < 0 {
        return false
      }
    }
  }

  return true
}
