import Testing

@testable import very_easy

@Test(arguments: [
  ([1, 2, 3, 4, 5], 3, true),
  ([1, 1, 2, 1, 1], 3, false),
  ([1, 1, 2, 1, 5, 4, 7], 7, true),
  ([1, 1, 2, 1, 5, 4, 7], 8, false),
  ([5, 5, 5, 6], 5, true),
  ([], 5, false),
])
func checkArrayContains(arr: [Int], num: Int, outcome: Bool) {
  #expect(checkArrayContains(arr, num) == outcome)
}
