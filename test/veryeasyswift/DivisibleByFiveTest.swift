import Testing

@testable import very_easy

@Test(arguments: [
  (7, false),
  (5, true),
  (15, true),
  (33, false),
  (-18, false),
  (999, false),
  (0, true),
])
func divisibleByFive(num: Int, outcome: Bool) {
  #expect(divisibleByFive(num) == outcome)
}
