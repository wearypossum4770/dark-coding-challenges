import Testing

@testable import easy

@Test(arguments: [
  ("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"], "ball"),
  ("Hello hello world!", ["world"], "hello"),
  ("apple banana banana apple apple", [], "apple"),
  ("dog cat dog", ["dog", "cat"], ""),
  ("one two two three three", [], "two"),
  ("", [], ""),
  ("Wow! Such, wow? Very-wow.", ["such"], "wow"),
  ("test test test", ["test"], ""),
  ("123 123 !@#", [], ""),
  ("echo echo echo echo", [], "echo"),
])
func mostCommonSafeWordTest(paragraph: String, banned: [String], expected: String) {
  #expect(mostCommonSafeWord(paragraph, banned) == expected)
}
