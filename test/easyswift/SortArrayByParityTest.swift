import Testing

@testable import easy

@Test(arguments: [
  ([3, 1, 2, 4], [4, 2, 1, 3]),
  ([0, 1, 2], [0, 2, 1]),
  ([0], [0]),
])
func sortArrayByParityTest(nums: [Int], outcome: [Int]) {
  var arr = nums
  #expect(sortArrayByParity(&arr) == outcome)
}
