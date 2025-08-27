import Testing

@testable import easy

@Test(arguments: [
  ("abcd", "abcde", "e"),
  ("", "y", "y"),
  ("a", "aa", "a"),
  ("aabbcc", "aabbccd", "d"),
])
func findTheDifferenceTest(s: String, t: String, expected: Character?) {
  #expect(findTheDifference(s, t) == expected)
}
