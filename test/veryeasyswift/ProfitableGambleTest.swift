import Testing

@testable import very_easy

@Test(arguments: [
  (0.2, 50, 9, true),
  (0.9, 1, 2, false),
  (0.9, 3, 2, true),
  (0.33, 10, 3.30, true),
  (0, 1000, 0.01, false),
  (0.1, 1000, 7, true),
  (0, 0, 0, false),
])
func profitableGamble(prob: Float, prize: Float, pay: Float, outcome: Bool) {
  #expect(profitableGamble(prob, prize, pay) == outcome)
}
