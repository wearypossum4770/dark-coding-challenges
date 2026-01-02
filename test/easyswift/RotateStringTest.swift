import Testing

@testable import easy

@Test(arguments: [
  ("abcde", "cdeab", true),
  ("abcde", "eabcd", true),
  ("abcde", "abcde", true),
  ("abcde", "abced", false),
  ("abcde", "edcba", false),
  ("aa", "a", false),
  ("a", "aa", false),
  ("abc", "abcd", false),
  ("aaaa", "aaaa", true),
  ("aabb", "bbaa", true),
  ("aabb", "abab", false),
  ("aabb", "abba", true),
  ("defdefdefabcabc", "defdefabcabcdef", true),
  ("bbbacddceeb", "ceebbbbacdd", true),
  ("a", "a", true),
  ("a", "b", false),
  ("", "", true),
  ("abcabc", "bcabca", true),
  ("abcabc", "cabacb", false),

])
func rotateStringTest(s: String, goal: String, expect: Int) {
  #expect(rotateString(s, goal) == expect)
}
