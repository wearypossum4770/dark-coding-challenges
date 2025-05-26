import Testing

@testable import very_easy

@Test(arguments: [

  (2, 3), (-9, -8), (0, 1), (999, 1000), (73, 74),
]) func nextInteger(value: Int, outcome: Int) { #expect(nextInteger(value) == outcome) }
