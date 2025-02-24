import Testing

@testable import very_easy

@Test(arguments: [
  (6, 360),
  (4, 240),
  (8, 480),
  (60, 3600),
])
func minutesToSeconds(minutes: Int, outcome: Int) {
  #expect(minutesToSeconds(minutes) == outcome)
}
