import Testing

@testable import very_easy

@Test(arguments: [
  ("Gerald", "Hello Gerald!"), ("Fatima", "Hello Fatima!"), ("Ed", "Hello Ed!"),
  ("Tiffany", "Hello Tiffany!"),
]) func nameStringGreeting(name: String, outcome: String) {
  #expect(nameStringGreeting(name) == outcome)
}
