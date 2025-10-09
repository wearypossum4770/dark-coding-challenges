import Testing

@testable import easy

@Test(arguments: [
  ("3 unique, can eat 3", [1, 1, 2, 2, 3, 3], 3),
  ("3 unique, can eat 2", [1, 1, 2, 3], 2),
  ("1 unique, can eat 2 -> only 1 type", [6, 6, 6, 6], 1),
  ("6 unique, can eat 3", [1, 2, 3, 4, 5, 6], 3),
  ("1 unique", [1, 1], 1),
  ("no candies can't eay any", [], 0),
  ("<constraint non-conforming> 1 unique, 1 count cannot eat", [1], 0),
  ("2 unique, can eat 1", [1, 2], 1),
])
func distributeCandiesTest(criteria: String, candyType: [Int], outcome: Int) {
  #expect(distributeCandies(candyType) == outcome)
}
