import Testing

@testable import very_easy

@Test(arguments: [
  (14, true, true),
  (15, true, true),
  (16, true, true),
  (14, false, false),
  (15, false, true),
  (16, false, true),
  (14.99999, true, true),
  (14.99999, false, false),
])
func acceptIntoMovie(age: Float, supervised: Bool, outcome: Bool) {
  #expect(acceptIntoMovie(age, supervised) == outcome)
}
