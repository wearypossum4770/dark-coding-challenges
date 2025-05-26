import Testing

@testable import very_easy

@Test(arguments: [(1, 0, 3600), (0, 0, 0), (2, 0, 7200), (1, 3, 3780), (0, 30, 1800)])
func hoursAndMinutesToSeconds(hours: Int, minutes: Int, outcome: Int) {
  #expect(hoursAndMinutesToSeconds(hours, minutes) == outcome)
}
