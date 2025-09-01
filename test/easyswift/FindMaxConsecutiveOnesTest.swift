import Testing

@testable import easy

@Test(arguments: [
  ([1, 1, 0, 1, 1, 1], 3),
  ([1, 0, 1, 1, 0, 1], 2),
])
func findMaxConsecutiveOnesTest(nums: [Int], outcome: Int) {
  #expect(findMaxConsecutiveOnes(nums) == outcome)
}
