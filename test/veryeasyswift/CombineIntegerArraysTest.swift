import Testing

@testable import very_easy

@Test(arguments: [
  ([1, 3, 5], [2, 6, 8], [1, 3, 5, 2, 6, 8]), ([7, 8], [10, 9, 1, 1, 2], [7, 8, 10, 9, 1, 1, 2]),
  ([4, 5, 1], [3, 3, 3, 3, 3], [4, 5, 1, 3, 3, 3, 3, 3]),
]) func combineIntegerArrays(a: [Int], b: [Int], outcome: [Int]) {
  #expect(combineIntegerArrays(a, b) == outcome)
}
