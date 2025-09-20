import Testing

@testable import easy

let sb = "a" + String(repeating: "x", count: 9999) + "b" + String(repeating: "y", count: 9999) + "c"
@Test(arguments: [

  ("abc", "ahbgdc", true),
  ("", "", true),
  ("", "anything", true),
  ("a", "a", true),
  ("a", "b", false),
  ("z", "abc", false),
  ("acb", "abc", false),
  ("xyz", "abcxyz", true),
  ("aaa", "aaaaaa", true),
  ("aaa", "aa", false),
  ("abc", "abc", true),
  ("abc", sb, true),
  ("ace", "abcde", true),
  ("aec", "abcde", false),
  ("axc", "ahbgdc", false),

])
func stringIsSubsequenceTest(s: String, t: String, outcome: Bool) {
  #expect(stringIsSubsequence(s, t) == outcome)
}
