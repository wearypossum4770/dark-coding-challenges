import Testing

@testable import easy

@Test(arguments: [
  ([2, 2, 3, 4], 2),
  ([1, 2, 2, 3, 3, 3], 3),
  ([2, 2, 2, 3, 3], -1),
])
func findLuckyTest(nums: [Int], outcome: Int) {
  #expect(findLucky(nums) == outcome)
}
