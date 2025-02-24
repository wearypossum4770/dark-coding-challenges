import Testing

@testable import very_easy

@Test(arguments: [
  ("John", "Doe", "Doe, John"),
  ("First", "Last", "Last, First"),
  ("A", "B", "B, A"),
  (",", ",", ",, ,"),
])
func nameStringConcat(firstName: String, lastName: String, outcome: String) {
  #expect(nameStringConcat(firstName, lastName) == outcome)
}
