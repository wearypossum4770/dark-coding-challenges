import Testing

@testable import very_easy

@Test(arguments: [
  (4, 8, false),
  (2, 2, true),
  (0, 6, false),
  (2, 3, false),
])
func isSameNum(a: Int, b: Int, outcome: Bool) {
  #expect(isSameNum(a, b) == outcome)
}
