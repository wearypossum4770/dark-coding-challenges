import Testing

@testable import very_easy

@Test(arguments: [
  ("Matt", "Hello, Matt!"), ("Helen", "Hello, Helen!"), ("Mubashir", "Hello, my Love!"),

]) func nameStringEdabitGreeting(name: String, outcome: String) {
  #expect(nameStringEdabitGreeting(name) == outcome)
}
