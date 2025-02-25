import Testing

@testable import very_easy

@Test(arguments: [
  (2004, true),
  (8, true),
  (4, true),
  (2019, false),
  (1970, false),
  (2021, false),
  (1934, false),
  (1874, false),
  (1968, true),
  (2024, true),
  (2020, true),
  (2000, true),
  (2018, false),
  (1900, false),
  (2100, false),
  (2200, false),
])
func leapYear(year: Int, outcome: Bool) {
  #expect(leapYear(year) == outcome)
}
