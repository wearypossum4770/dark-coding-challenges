import Testing

@testable import easy

@Test(arguments: [
  ([2, 2, 1], 1),
  ([4, 1, 2, 1, 2], 4),
  ([1], 1),
])
func singleNumberTest(nums: [Int], outcome: Int) {
  #expect(singleNumber(nums) == outcome)
}
