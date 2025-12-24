import Testing

@testable import easy

@Test(arguments: [
  ("USA", true),
  ("UsA", false),
  ("leetcode", true),
  ("Google", true),
  ("FlaG", false),
  ("g", true),
  ("G", true),
  ("LeetCode", false),
  ("aPPle", false),
  ("APPLE", true),
  ("apple", true),
  ("Apple", true),
  ("AppLe", false),
  ("zZZ", false),
  ("HELlo", false),
  ("qwerty", true),
  ("Qwerty", true),
  ("QWERTY", true),
  ("QwErTy", false),
  ("Abcdefg", true),
  ("abcdEfg", false),
])
func detectCapitalUseTest(word: String, expected: Bool) {
  #expect(detectCapitalUse(word) == expected)
}
