import Testing

@testable import easy

@Test(arguments: [
  ("1234", false),
  ("24123", true),
])
func stringIntegerIsBalancedTest(num: String, outcome: Bool) {
  #expect(stringIntegerIsBalanced(num) == outcome)
}
