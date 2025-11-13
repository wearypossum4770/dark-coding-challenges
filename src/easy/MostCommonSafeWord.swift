import Foundation

func mostCommonSafeWord(_ paragraph: String, _ banned: [String]) -> String {
  var freq: [String: Int] = [:]
  let separators = "!?',;. "
  let words = paragraph.lowercased().split(whereSeparator: { separators.contains($0) }).map(
    String.init)

  for word in words {
    if !banned.contains(word) {
      freq[word, default: 0] += 1
    }
  }
  let sorted = freq.sorted { $0.value > $1.value }
  return sorted.first?.key ?? ""
}
