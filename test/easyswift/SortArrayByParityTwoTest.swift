import Testing

@testable import easy

@Test(arguments: [
  ([4, 2, 5, 7], [4, 5, 2, 7]),
  ([2, 3], [2, 3]),

])
func sortArrayByParityTwoTest(nums: [Int], outcome: [Int]) {
  #expect(sortArrayByParityTwo(nums) == outcome)
}
