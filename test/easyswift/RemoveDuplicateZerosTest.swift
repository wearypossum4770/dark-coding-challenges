import Testing

@testable import easy

@Test(arguments: [
  ([1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]),
  ([1, 2, 3], [1, 2, 3]),
  ([0, 0, 0], [0, 0, 0]),
  ([0], [0]),
  ([7], [7]),
  ([1, 2, 0], [1, 2, 0]),
  ([0, 1, 0, 2, 0, 3], [0, 0, 1, 0, 0, 2]),
])
func removeDuplicateZerosTest(nums: [Int], outcome: [Int]) {
  var mutable = nums
  removeDuplicateZeros(&mutable)
  #expect(mutable == outcome)
}
