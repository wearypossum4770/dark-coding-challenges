import Testing

@testable import very_easy

@Test(arguments: [
  (9, 10, true), (9, 9, false), (1, 9, true), (10, 1, true), (10, 10, true), (8, 2, true),
  (8, 3, false), (10, 42, true), (12, -2, true),
]) func makesTen(a: Int, b: Int, outcome: Bool) { #expect(makesTen(a, b) == outcome) }
