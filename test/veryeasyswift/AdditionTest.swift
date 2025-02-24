import Testing

@testable import very_easy

@Test(
  "Learn swift addition",
  arguments: [
    (2, 3, 5),
    (-3, -6, -9),
    (7, 3, 10),
    (88, 2, 90),
    (1, 2, 3),
    (-1, 1, 0),
    (0, 0, 0),
    (100, 200, 300),
  ])
func additionTest(a: Int, b: Int, total: Int) {
  #expect(addition(a, b) == total)

}
