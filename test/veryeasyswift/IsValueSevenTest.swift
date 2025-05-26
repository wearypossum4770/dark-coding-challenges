import Testing

@testable import very_easy

@Test(arguments: [(4, false), (9, false), (7, true), (10, false), (20, false), (7, true)])
func isValueSeven(value: Int, outcome: Bool) { #expect(isValueSeven(value) == outcome) }
