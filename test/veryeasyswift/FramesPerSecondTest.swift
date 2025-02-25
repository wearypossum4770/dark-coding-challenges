import Testing

@testable import very_easy

@Test(arguments: [
  (1, 1, 60),
  (10, 1, 600),
  (10, 25, 15000),
  (500, 60, 1_800_000),
  (0, 60, 0),
  (99, 1, 5940),
  (419, 70, 1_759_800),
  (52, 33, 102960),
])
func framesPerSecond(minutes: Int, frames: Int, outcome: Int) {
  #expect(framesPerSecond(minutes, frames) == outcome)
}
