import Testing

@testable import very_easy

@Test(arguments: [
  (8, 3, 2, true),
  (8, 3, 3, false),
  (24, 12, 2, true),
  (5, 6, 1, false),
  (5, 0, 100, true),
  (15, 2, 7, true),
  (15, 2, 8, false),
])
func equalSlices(pizza: Int, people: Int, slices: Int, outcome: Bool) {
  #expect(equalSlices(pizza, people, slices) == outcome)
}
