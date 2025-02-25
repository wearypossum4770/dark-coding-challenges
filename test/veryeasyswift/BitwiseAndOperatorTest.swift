import Testing

@testable import very_easy

@Test(arguments: [
  (true, true, true),
  (true, false, false),
  (false, true, false),
  (false, false, false),
])
func bitwiseAndOperator(a: Bool, b: Bool, outcome: Bool) {
  #expect(bitwiseAndOperator(a, b) == outcome)
}
