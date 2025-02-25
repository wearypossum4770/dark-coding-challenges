import Testing

@testable import very_easy

@Test(arguments: [
  ("a", "something a"),
  ("is cooking", "something is cooking"),
  (" is cooking", "something  is cooking"),
  ("is better than nothing", "something is better than nothing"),
  ("Bob Jane", "something Bob Jane"),
  ("something", "something something"),
])
func giveMeSomething(phrase: String, outcome: String) {
  #expect(giveMeSomething(phrase) == outcome)
}
