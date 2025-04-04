import Testing

@testable import easy

@Test(arguments: [
  (["h", "e", "l", "l", "o"], ["o", "l", "l", "e", "h"]),
  (["a", "b", "c", "d"], ["d", "c", "b", "a"]),
  (["z"], ["z"]),
  ([], []),
])
func reverseStringTest(input: [Character], outcome: [Character]) {
  var mutableInput = input
  reverseString(&mutableInput)
  #expect(mutableInput == outcome)
}
