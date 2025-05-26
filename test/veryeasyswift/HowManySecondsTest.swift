import Testing

@testable import very_easy

@Test(arguments: [(2, 7_200), (10, 36_000), (24, 86_400), (36, 129_600)]) func howManySeconds(
  hours: Int, outcome: Int
) { #expect(howManySeconds(hours) == outcome) }
