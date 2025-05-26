import Testing

@testable import very_easy

@Test(arguments: [
  (3, "odd"), (0, "even"), (7, "odd"), (12, "even"), (6474, "even"), (0563, "odd"), (3, "odd"),
  (146, "even"), (19, "odd"), (0_000_001_111_100_000, "even"), (301, "odd"), (-3, "odd"),
  (-0, "even"), (-7, "odd"), (-12, "even"), (-6474, "even"), (-0563, "odd"), (-3, "odd"),
  (-0_000_001_111_100_000, "even"), (-301, "odd"),
]) func isEvenOrOdd(num: Int, outcome: String) { #expect(isEvenOrOdd(num) == outcome) }
