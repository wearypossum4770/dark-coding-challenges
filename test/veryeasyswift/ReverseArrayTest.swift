import Testing

@testable import very_easy

@Test(arguments: [
  ([1, 2, 3, 4], [4, 3, 2, 1]), ([5, 6, 7], [7, 6, 5]), ([9, 9, 2, 3, 4], [4, 3, 2, 9, 9]),
  ([3, 3], [3, 3]), ([-1, -1, -1], [-1, -1, -1]), ([], []),
]) func reverseArray(arr: [Int], outcome: [Int]) { #expect(reverseArray(arr) == outcome) }
