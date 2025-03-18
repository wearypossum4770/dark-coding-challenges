import Testing

@testable import easy

@Test(arguments: [
  (2, 1),
  (89, 0),
  (0, 1),
  (39, 0),
  (555, 0),
  (9475, 0),
  (9_926_315, 1),
  (93084, 1),
  (548834, 1),
  (2_147_483_647, 0),
  (365, 0),
  (120, 0),
  (1253, 0),
  (153, 1),
  (-153, 0),
  (407, 1),
  (370, 1),
  (371, 1),
  (1634, 1),
  (8208, 1),
  (9474, 1),

])
func armstrongNumbers(number: Int, outcome: Int) {
  #expect(armstrongNumbers(number) == outcome)
}
