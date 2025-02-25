import Testing

@testable import very_easy

@Test(arguments: [
  (1, false),
  (100, true),
  (1000, true),
  (111000, true),
  (-1, false),
  (0, true),
  (-100, true),
])
func divisibleBy100(num: Int, outcome: Bool) {
  #expect(divisibleBy100(num) == outcome)
}
