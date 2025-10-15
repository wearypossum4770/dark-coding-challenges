func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
  var result = [Int]()
  for (i, word) in words.enumerated() {
    if word.contains(x) {
      result.append(i)
    }
  }
  return result
}
