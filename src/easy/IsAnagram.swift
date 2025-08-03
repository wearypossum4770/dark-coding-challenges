import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else { return false }
  var frequency: [Character: Int] = [:]
  for char in s { frequency[char, default: 0] += 1 }

  for char in t {
    if let count = frequency[char] { frequency[char] = count - 1 } else { return false }
  }
  return frequency.allSatisfy { $0.value == 0 }
}
