import Testing

@testable import very_easy

@Test(arguments: [
  (10, 3650),
  (0, 0),
  (73, 26645),
])
func calcAge(age: Int, outcome: Int) {
  #expect(calcAge(age) == outcome)
}
