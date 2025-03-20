import Testing

@testable import easy

@Test(arguments: [
  ([1, 2, 3], [1, 1], 1),
  ([1, 2], [1, 2, 3], 2),
  ([10, 9, 8, 7], [5, 6, 7, 8], 2),
  ([], [1, 2], 0),
  ([1, 2], [], 0),
])
func findContentChildren(children: [Int], cookies: [Int], outcome: Int) {
  var result = findContentChildren(children, cookies)
  #expect(result == outcome, "expected: \(outcome) \t received \(result)")
}
