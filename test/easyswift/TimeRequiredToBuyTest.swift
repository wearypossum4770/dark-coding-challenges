import Testing

@testable import easy

@Test(arguments: [
  ([2, 3, 2], 2, 6),
  ([5, 1, 1, 1], 0, 8),
  ([1], 0, 1),
  ([1, 1, 1, 1], 3, 4),
  ([3, 3, 3], 0, 7),
  ([3, 3, 3], 1, 8),
  ([3, 3, 3], 2, 9),
  ([1, 2, 3, 4], 3, 10),
  ([4, 3, 2, 1], 0, 10),
  ([4, 3, 2, 1], 1, 9),
  ([4, 3, 2, 1], 2, 7),
  ([4, 3, 2, 1], 3, 4),
  ([100, 100, 100], 1, 299),
  ([1, 100, 1], 1, 102),
  ([2, 1], 1, 2),
  ([2, 1], 0, 3),
  ([1, 2], 0, 1),
  ([1, 2], 1, 3),
])
func timeRequiredToBuyTest(tickets: [Int], k: Int, expected: Int) {
  #expect(timeRequiredToBuy(tickets, k) == expected)
}
