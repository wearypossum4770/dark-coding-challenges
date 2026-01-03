import Testing

@testable import easy

@Test(arguments: [
  ("a", false),
  ("aa", true),
  ("ab", false),
  ("aba", false),
  ("abab", true),
  ("ababba", false),
  ("abcabc", true),
  ("abcabcabcabc", true),
  ("abcdabcd", true),
  ("abcdabce", false),
  ("aaaaaaaa", true),
  ("aaaaaaab", false),
  ("abaababaab", true),
  ("abaaba", true),
  ("abaabab", false),
  ("xyzxyzxyz", true),
  ("xyzxy", false),
  ("zz", true),
  ("z", false),
  ("ababababx", false),
])
func repeatedSubstringPatternTest(s: String, expect: Bool) {
  #expect(repeatedSubstringPattern(s) == expect)
}
