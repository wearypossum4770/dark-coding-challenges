import Testing

@testable import very_easy

@Test(arguments: [
  (5, 3, 15),
  (8, 5, 40),
  (5, 4, 20),
  (2, 3, 6),
  (10000, 10000, 100_000_000),
  (-2, -5, -1),
  (0, 3, -1),
  (5, -3, -1),
  (0, 1, -1),
  (-1, 0, -1),
])
func rectangleArea(height: Int, width: Int, outcome: Int) {
  #expect(rectangleArea(height, width) == outcome)
}
