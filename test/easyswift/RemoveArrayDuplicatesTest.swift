import Testing

@testable import easy

@Test(arguments: [
  ([1, 1, 2], 2),
  ([1, 2, 2, 3, 3], 3),
  ([1, 1, 2, 2, 3, 3, 4], 4),
])
func removeArrayDuplicatesTest(nums: [Int], outcome: Int) {
  var mutable = nums
  #expect(removeArrayDuplicates(&mutable) == outcome)
}
