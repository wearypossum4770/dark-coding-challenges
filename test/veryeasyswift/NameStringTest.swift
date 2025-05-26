import Testing

@testable import very_easy

@Test(arguments: [
  ("Mubashir", "MubashirEdabit"), ("Matt", "MattEdabit"), ("Swift", "SwiftEdabit"),
  ("Airforce", "AirforceEdabit"),
]) func nameString(name: String, outcome: String) { #expect(nameString(name) == outcome) }
