import Testing

@testable import easy

@Test(arguments: [
  ("IceCreAm", "AceCreIm"),
  ("leetcode", "leotcede"),
  ("a", "a"),
  ("b", "b"),
  ("AEIOU", "UOIEA"),
  ("aeiou", "uoiea"),
  ("bcdfgh", "bcdfgh"),
  ("aA", "Aa"),
  ("a.b,e", "e.b,a"),
  ("hello world", "hollo werld"),
  ("aEiOu", "uOiEa"),
  (".,?!", ".,?!"),
  ("aaaaaa", "aaaaaa"),
  ("aAaaAa", "aAaaAa"),
])
func reverseVowelsTest(word: String, outcome: String) {
  #expect(reverseVowels(word) == outcome)
}
