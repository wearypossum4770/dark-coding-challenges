import Testing

@testable import very_easy

@Test(arguments: [
  (110, 3, 330),
  (230, 10, 2300),
  (480, 20, 9600),
])
func circuitPower(voltage: Int, current: Int, outcome: Int) {
  #expect(circuitPower(voltage, current) == outcome)
}
