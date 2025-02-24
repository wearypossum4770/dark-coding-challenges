import Testing

@testable import very_easy

@Test(arguments: [
  (5, false),
  (0, true),
  (-5, true),
  (1, false),
  (2, false),
  (10000, false),
  (0.5, false),
])
func lessThanOrEqualToZero(value: Double, outcome: Bool) {
  #expect(lessThanOrEqualToZero(value) == outcome)
}
