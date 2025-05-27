import BigInt
import Testing

@testable import very_easy

@Test(arguments: [
  (1850, false),
  (1565, false),
  (1920, true),
  (1924, true),
  (1928, true),
  (1940, true),
  (2021, false),
  (2024, true),
  (2000, true),
  (1900, false),
  (2023, false),
  (1, false),
  (0, true),
  (-400, true),
  (-100, false),
  (2_147_483_647, false),
])
func leapYearTest(year: Int, outcome: Bool) {
  #expect(leapYear(year) == outcome)
}

@Test(arguments: [
  (9_223_372_036_854_775_808, true)
])
func leapYearBigIntTest(year: BigUInt, outcome: Bool) {
  #expect(leapYearBigInt(year) == outcome)
}
