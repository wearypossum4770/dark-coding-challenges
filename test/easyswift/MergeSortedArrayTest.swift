import Testing

@testable import easy

@Test("Merge Sorted Arrays In Place", arguments: [
  ([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]),
  ([1], 1, [], 0, [1]),
  ([0], 0, [1], 1, [1]),
])
func mergeSortedArrayInPlace(
  first: [Int], firstSize: Int, second: [Int], secondSize: Int, outcome: [Int]
) {
  var nums = first
  mergeSortedArrayInPlace(&nums, firstSize, second, secondSize)
  #expect(nums == outcome)
}
