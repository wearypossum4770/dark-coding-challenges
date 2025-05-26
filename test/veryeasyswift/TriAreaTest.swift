import Testing

@testable import very_easy

@Test(arguments: [(3, 2, 3), (5, 4, 10), (10, 10, 50), (0, 60, 0), (12, 11, 66)]) func triArea(
  base: Int, height: Int, outcome: Int
) { #expect(triArea(base, height) == outcome) }
