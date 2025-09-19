import Testing

@testable import easy

@Test(arguments: [
  ("a", "b", false),
  ("aa", "aab", true),
  ("a", "a", true),
  ("aa", "ab", false),
  ("abc", "cbad", true),
  ("", "anything", true),
  ("a", "", false),
  ("", "", true),
  ("aA", "aa", true),
  ("Aa", "aA", true),
  ("zzz", "zzzzzz", true),
  ("zzzz", "zzz", false),
  ("hello world", "dlrow olleh", true),

])
func canConstructRansomNoteTest(note: String, magazine: String, outcome: Bool) {
  #expect(canConstructRansomNote(note, magazine) == outcome)
}
