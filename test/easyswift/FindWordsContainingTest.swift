import Testing

@testable import easy

@Test(arguments: [
  (["abc", "bcd", "aaaa", "cbc"], "a", [0, 2]),
  (["leet", "code"], "e", [0, 1]),
  (["abc", "bcd", "aaaa", "cbc"], "z", []),
  (["apple", "banana", "cherry", "grape"], "a", [0, 1, 3]),
])
func findWordsContainingTest(words: [String], char: String, outcome: [Int]) {
  #expect(findWordsContaining(words, Character(char)) == outcome)
}
