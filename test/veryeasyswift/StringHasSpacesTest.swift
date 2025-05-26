import Testing

@testable import very_easy

@Test(arguments: [
  ("Foo", false), ("Foo bar", true), ("Foo ", true), (" Foo", true), (" ", true),
  (",./;'[]-=", false),
]) func stringHasSpaces(text: String, outcome: Bool) { #expect(stringHasSpaces(text) == outcome) }
