import Testing

@testable import very_easy

@Test(arguments: [
  ("", true), (" ", false), ("            ", false), ("38215", false), ("afjabsdf", false),
  ("!?@&", false),
]) func isStringEmpty(input: String, outcome: Bool) { #expect(isStringEmpty(input) == outcome) }
