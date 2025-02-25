import Testing

@testable import very_easy

@Test(arguments: [
  ([5, 10, 15, 20, 25], [5, 25]),
  ([3, 2, 1], [3, 1]),
])
func arrayFirstAndLastInt(arr: [Int], outcome: [Int]) {
  #expect(arrayFirstAndLastItem(arr) == outcome)
}

@Test(arguments: [
  (["hello", "edabit", "dot", "com"], ["hello", "com"]),
  (["one", "two"], ["one", "two"]),
])

func arrayFirstAndLastString(arr: [String], outcome: [String]) {
  #expect(arrayFirstAndLastItem(arr) == outcome)

}
