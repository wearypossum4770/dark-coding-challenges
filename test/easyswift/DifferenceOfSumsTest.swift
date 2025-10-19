import Testing

@testable import easy

@Test(arguments: [
  (10, 3, 19),
  (5, 6, 15),
  (5, 1, -15),
])
func differenceOfSumsTest(n: Int, m: Int, outcome: Int) {
  #expect(differenceOfSums(n, m) == outcome)
}
