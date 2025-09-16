import Testing

@testable import easy

@Test(arguments: [
  ("✅ Normal case", [1, 2, 3, 4], [1, 3, 6, 10]),
  ("✅ All 1s", [1, 1, 1, 1, 1], [1, 2, 3, 4, 5]),
  ("✅ Mixed values", [3, 1, 2, 10, 1], [3, 4, 6, 16, 17]),
  ("🟢 Empty array", [], []),
  ("🟢 Single element", [5], [5]),
  ("🟢 Negative numbers", [-1, -2, -3], [-1, -3, -6]),
  ("🟢 Alternating positives & negatives", [1, -1, 1, -1, 1], [1, 0, 1, 0, 1]),
])
func runningArraySumTest(criteria: String, nums: [Int], outcome: [Int]) {
  #expect(runningArraySum(nums) == outcome)
}
