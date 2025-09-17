import Testing

@testable import easy

@Test(arguments: [
  (2, 2),
  (0, 0),
  (1, 1),
  (8, 4),
  (14, 6),
  (123, 12),
  (1_000_000, 26),
  (-1, 0),
  (999_999, 31),
])
func numberOfStepsToZeroTest(num: Int, outcome: Int) {
  #expect(numberOfStepsToZero(num) == outcome)
}
