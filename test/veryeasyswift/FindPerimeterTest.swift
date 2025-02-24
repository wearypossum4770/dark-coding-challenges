import Testing

@testable import very_easy

@Test(arguments: [
  (6, 7, 26),
  (20, 10, 60),
  (2, 9, 22),
])
func findPerimeter(length: Int, width: Int, outcome: Int) {
  #expect(findPerimeter(length, width) == outcome)
}
