import Testing

@testable import easy

@Test(arguments: [
  ([12, 345, 2, 6, 7896], 2),
  ([555, 901, 482, 1771], 1),
])
func findEvenDigitNumbersTest(nums: [Int], outcome: Int) {
  #expect(findEvenDigitNumbers(nums) == outcome)
}
