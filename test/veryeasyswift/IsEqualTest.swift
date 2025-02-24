import Testing

@testable import very_easy

@Test(arguments: [
  (2, 2, true),
  (88, 88, true),
  (36, 35, false),
  (1, 1, true),
  (5, 6, false),
])
func isEqual(a: Int, b: Int, outcome: Bool) {
  #expect(isEqual(a, b) == outcome)
}
