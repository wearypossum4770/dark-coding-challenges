import Testing

@testable import very_easy

@Test(arguments: [(5, 4, 8), (8, 3, 10), (7, 9, 15), (10, 4, 13), (7, 2, 8)]) func nextTriangleEdge(
  a: Int, b: Int, outcome: Int
) { #expect(nextTriangleEdge(a, b) == outcome) }
