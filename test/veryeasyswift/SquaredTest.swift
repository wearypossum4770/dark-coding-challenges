import Testing

@testable import very_easy

@Test(arguments: [
  (10, 100),
  (69, 4761),
  (666, 443556),
  (-21, 441),
  (21, 441),
])
func squared(num: Double, outcome: Double) {
  #expect(squared(num) == outcome, "Expected \(outcome)")
}
