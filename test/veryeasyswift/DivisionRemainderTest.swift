import Testing

@testable import very_easy

@Test(arguments: [
  (7, 2, 1),
  (3, 4, 3),
  (-9, 45, -9),
  (5, 5, 0),
])
func divisionRemainder(a: Int, b: Int, outcome: Int) {
  #expect(divisionRemainder(a, b) == outcome)
}
