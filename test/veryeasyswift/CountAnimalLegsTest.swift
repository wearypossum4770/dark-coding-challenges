import Testing

@testable import very_easy

@Test(arguments: [
  (5, 2, 8, 50),
  (3, 4, 7, 50),
  (1, 2, 3, 22),
  (3, 5, 2, 34),

])
func countAnimalLegs(chickens: Int, cows: Int, pigs: Int, outcome: Int) {
  #expect(countAnimalLegs(chickens, cows, pigs) == outcome)
}
