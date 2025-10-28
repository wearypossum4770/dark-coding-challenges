import Testing

@testable import easy

@Test(arguments: [
  (["abc", "car", "ada", "racecar", "cool"], "ada"),
  (["notapalindrome", "racecar"], "racecar"),
  (["def", "ghi"], ""),
])
func findFirstPalindromeTest(words: [String], outcome: String) {
  #expect(findFirstPalindrome(words) == outcome)
}
