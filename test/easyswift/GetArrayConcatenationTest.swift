import Testing

@testable import easy

@Test(arguments: [
  ([1, 2, 1], [1, 2, 1, 1, 2, 1]),
  ([1, 3, 2, 1], [1, 3, 2, 1, 1, 3, 2, 1]),
  ([1], [1, 1]),
  ([1000], [1000, 1000]),
  ([1, 1, 1], [1, 1, 1, 1, 1, 1]),
  ([2, 4, 6], [2, 4, 6, 2, 4, 6]),
  ([5, 10], [5, 10, 5, 10]),
  ([0, 1, 0], [0, 1, 0, 0, 1, 0]),
  ([1, 2, 3, 2, 1], [1, 2, 3, 2, 1, 1, 2, 3, 2, 1]),
])
func getArrayConcatenationTest(nums: [Int], expected: [Int]) {
  #expect(getArrayConcatenation(nums) == expected)
}
