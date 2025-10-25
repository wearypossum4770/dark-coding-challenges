import Testing

@testable import easy

@Test(arguments: [
  ([[1, 1], [2, 3], [3, 2]], true),
  ([[1, 1], [2, 2], [3, 3]], false),
  ([[1, 0], [0, 0], [2, 0]], false),
  ([[0, 1], [0, 2], [1, 2]], true),
])
func isBoomerangTest(points: [[Int]], outcome: Bool) {
  #expect(isBoomerang(points) == outcome)
}
