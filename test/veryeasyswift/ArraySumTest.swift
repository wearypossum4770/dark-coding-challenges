import Testing

@testable import very_easy

@Test(
  "Array summation",
  arguments: [
    ([1_000_000_001, 1_000_000_002, 1_000_000_003, 1_000_000_004, 1_000_000_005], 5_000_000_015)
  ])
func arraySumTest(_ param: [Int], _ expected: Int) {
  #expect(arraySum(array: param) == expected)
}
