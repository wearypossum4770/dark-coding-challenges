import Testing

@testable import very_easy

@Test(arguments: [
  (false, true),
  (true, false),
])
func flipTheBoolean(input: Bool, outcome: Bool) {
  #expect(flipTheBoolean(input) == outcome)
}
