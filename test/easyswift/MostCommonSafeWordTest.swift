import Testing

@testable import easy

@Test(arguments: [
  ("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"], "ball"),
  ("Hello hello world!", ["world"], "hello"),
  ("apple banana banana apple apple", [], "apple"),
  ("dog cat dog", ["dog", "cat"], ""),
  ("one two two two three three", [], "two"),
  ("", [], ""),
  ("Bob. hIt, baLl", ["bob", "hit"], "ball"),
  ("Apple apple APPLE!", ["apple"], ""),
  ("Wow! Such, wow? Very-wow.", ["such"], "wow"),
  ("test test test", ["test"], ""),
  ("echo echo echo echo", [], "echo"),
  ("Wow! wow? wow. really, really... REALLY!", ["wow"], "really"),
  ("a.", [], "a"),
  ("a b.b", [], "b"),
])
func mostCommonSafeWordTest(paragraph: String, banned: [String], expected: String) {
  #expect(mostCommonSafeWord(paragraph, banned) == expected)
}
