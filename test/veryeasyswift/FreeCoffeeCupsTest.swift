import Testing

@testable import very_easy

@Test(arguments: [
  (6, 7),
  (3, 3),
  (7, 8),
  (12, 14),
  (213, 248),
  (16, 18),
])
func freeCoffeeCups(cups: Int, outcome: Int) {
  #expect(freeCoffeeCups(cups) == outcome)
}
