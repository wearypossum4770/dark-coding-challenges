import Testing

@testable import very_easy

@Test(arguments: [(-4, -4), (212, -212), (-125, -125), (932123, -932123)]) func returnNegative(
  num: Int, outcome: Int
) { #expect(returnNegative(num) == outcome) }
