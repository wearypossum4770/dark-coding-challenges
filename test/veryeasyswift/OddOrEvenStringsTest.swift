import Testing

@testable import very_easy

@Test(arguments: [
  ("apples", true), ("banana", true), ("cherry", true), ("mango", false), ("peach", false),
  ("pears", false),
]) func oddOrEvenStrings(text: String, outcome: Bool) { #expect(oddOrEvenStrings(text) == outcome) }
