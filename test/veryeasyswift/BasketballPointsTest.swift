import Testing

@testable import very_easy

@Test(arguments: [
  (1, 1, 5),
  (1, 2, 8),
  (2, 1, 7),
  (2, 2, 10),
  (69, 420, 1398),
])
func basketballPoints(two: Int, three: Int, outcome: Int) {
  #expect(basketballPoints(two, three) == outcome)
}
