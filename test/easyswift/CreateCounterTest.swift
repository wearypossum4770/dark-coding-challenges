import Testing

@testable import easy

let thousandCalls = Array(repeating: "call", count: 1_000)
let thousandExpected = Array(5..<1005)

@Test(arguments: [
  ("Example 1: starting at 10 with 3 calls", 10, ["call", "call", "call"], [10, 11, 12]),
  (
    "Example 2: starting at -2 with 5 calls", -2, Array(repeating: "call", count: 5),
    [-2, -1, 0, 1, 2]
  ),
  ("Edge Case 1: starting at 0 with no calls", 0, [], []),
  ("Edge Case 2: single call from 1000", 1000, ["call"], [1000]),
  ("single call from zero", 0, ["call"], [0]),
  (
    "Edge Case 3: starting at -1000 with 3 calls", -1000, ["call", "call", "call"],
    [-1000, -999, -998]
  ),
  ("lower bound near -1_000", -1_000, ["call", "call"], [-1_000, -999]),
  ("upp bound near 1_000", 999, ["call", "call", "call"], [999, 1_000, 1_001]),
  ("Edge Case 4: 1000 calls starting from 5", 5, thousandCalls, thousandExpected),
  (
    "mutliple increments (10 calls)", 3,
    Array(repeating: "call", count: 10),
    [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  ),
  (
    "stress test (20 increments)", 42,
    Array(repeating: "call", count: 20),
    [42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61]
  ),
  ("single call (simple check)", 7, ["call"], [7]),
  (
    "midrange five calls", 100, Array(repeating: "call", count: 5), [100, 101, 102, 103, 104]
  ),
])
func createCounterTest(criteria: String, n: Int, operations: [String], outcome: [Int]) {
  let counter = createCounter(n)

  var actual = Array(repeating: 0, count: operations.count)
  for (i, _) in operations.enumerated() {
    capture(&actual, i, counter)
  }
  #expect(actual == outcome)
}
@Test(arguments: [1, 2, 3, 4, 5])
func counterClosureTest(_ n: Int) {
  let counter = createCounter(n)
  #expect(counter() == n)
}
