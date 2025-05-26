import Testing

@testable import very_easy

@Test(arguments: [(1, 2, 3, 5), (5, 5, 5, 20), (1, 0, 0, 3), (0, 0, 15, 0), (0, 7, 0, 7)])
func footballPoints(wins: Int, draws: Int, losses: Int, outcome: Int) {
  #expect(footballPoints(wins, draws, losses) == outcome)
}
