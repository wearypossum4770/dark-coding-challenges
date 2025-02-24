import Testing

@testable import very_easy

@Test(arguments: [
  (true, "true"),
  (false, "false"),
])
func boolToString(param: Bool, outcome: String) {
  #expect(boolToString(param) == outcome)
}
