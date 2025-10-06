import Testing

@testable import easy

@Test(arguments: [
  (0, []),
  (1, [[1]]),
  (2, [[1], [1, 1]]),
  (3, [[1], [1, 1], [1, 2, 1]]),
  (4, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]),
  (5, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]),
  (6, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]),
])
func pascalsTriangleTest(numRows: Int, outcome: [[Int]]) {
  #expect(pascalsTriangle(numRows) == outcome)
}
