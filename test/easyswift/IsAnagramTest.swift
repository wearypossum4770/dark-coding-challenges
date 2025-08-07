import Testing

@testable import easy

@Test(arguments: [
  ("anagram", "nagaram", true), ("listen", "silent", true), ("triangle", "integral", true),
  ("apple", "pale", false), ("aacc", "ccac", false),
  // Edge cases
  ("", "", true),  // Two empty strings are anagrams
  ("a", "a", true),  // Single character strings are anagrams
  ("a", "b", false),  // Different single characters are not anagrams
  ("aaaaa", "aaaaa", true),  // Identical strings
  ("abcd", "abdc", true),  // String with repeated characters

]) func isAnagramTest(first: String, second: String, outcome: Bool) {
  #expect(isAnagram(first, second) == outcome)
}

