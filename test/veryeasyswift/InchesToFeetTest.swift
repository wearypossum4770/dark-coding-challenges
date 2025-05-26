import Testing

@testable import very_easy

@Test(arguments: [(12, 1), (360, 30), (3612, 301), (324, 27), (3012, 251), (11, 0)])
func inchesToFeet(inches: Int, outcome: Int) { #expect(inchesToFeet(inches) == outcome) }
