import Testing

@testable import very_easy

@Test(arguments: [
  (2, 8),
  (3, 27),
  (4, 64),
  (5, 125),
  (10, 1000),
])
func cubes(value: Int, outcome: Int) {
  #expect(cubes(value) == outcome)
}
