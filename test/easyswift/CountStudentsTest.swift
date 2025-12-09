import Testing

@testable import easy

@Test(arguments: [
  ([1, 1, 0, 0], [0, 1, 0, 1], 0),
  ([1, 1, 1, 0, 0, 1], [1, 0, 0, 0, 1, 1], 3),
  ([0, 0, 0], [0, 0, 0], 0),
  ([1, 1, 1], [1, 1, 1], 0),
  ([1, 0, 1, 0], [1, 0, 1, 0], 0),
  ([0, 1, 0, 1], [1, 0, 1, 0], 0),
  ([1], [0], 1),
  ([0], [1], 1),
  ([0], [0], 0),
  ([1], [1], 0),
  ([0, 1, 0, 1, 1, 0], [1, 1, 0, 0, 0, 1], 0),
  ([1, 1, 1, 1, 1], [0, 0, 0, 0, 0], 5),
  ([0, 0, 0, 0, 0], [1, 1, 1, 1, 1], 5),
])
func countStudentsTest(students: [Int], sandwiches: [Int], expected: Int) {
  #expect(countStudents(students, sandwiches) == expected)
}
