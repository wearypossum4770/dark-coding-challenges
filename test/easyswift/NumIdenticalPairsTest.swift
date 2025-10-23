import Testing

@testable import easy

@Test(arguments: [
  ([1, 1, 1, 1], 6),
  ([1, 2, 3], 0),
  ([1, 2, 3, 1, 1, 3], 4),
])
func numIdenticalPairsTest(points: [Int], outcome: Int) {
  #expect(numIdenticalPairs(points) == outcome)
}
