func reverseWordPrefix(_ word: String, _ c: Character) -> String {

  var index = word.startIndex

  while index < word.endIndex {
    var result = Array(repeating: Character(" "), count: word.count)
    var position = 0
    if word[index] == c {
      var left = index
      var right = word.index(after: index)
      while true {
        result[position] = word[left]
        position += 1
        if left == word.startIndex {
          break
        }
        left = word.index(before: left)
      }
      while right < word.endIndex {
        result[position] = word[right]
        right = word.index(after: right)
        position += 1
      }
      return String(result)
    }
    index = word.index(after: index)
  }
  return word
}
