import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/count_students.dart';

class CountStudentsTestCases {
  List<int> students;
  List<int> sandwiches;
  int expected;
  CountStudentsTestCases(this.students, this.sandwiches, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      CountStudentsTestCases([1, 1, 0, 0], [0, 1, 0, 1], 0),
      CountStudentsTestCases([1, 1, 1, 0, 0, 1], [1, 0, 0, 0, 1, 1], 3),
      CountStudentsTestCases([0, 0, 0], [0, 0, 0], 0),
      CountStudentsTestCases([1, 1, 1], [1, 1, 1], 0),
      CountStudentsTestCases([1, 0, 1, 0], [1, 0, 1, 0], 0),
      CountStudentsTestCases([0, 1, 0, 1], [1, 0, 1, 0], 0),
      CountStudentsTestCases([1], [0], 1),
      CountStudentsTestCases([0], [1], 1),
      CountStudentsTestCases([0], [0], 0),
      CountStudentsTestCases([1], [1], 0),
      CountStudentsTestCases([0, 1, 0, 1, 1, 0], [1, 1, 0, 0, 0, 1], 0),
      CountStudentsTestCases([1, 1, 1, 1, 1], [0, 0, 0, 0, 0], 5),
      CountStudentsTestCases([0, 0, 0, 0, 0], [1, 1, 1, 1, 1], 5),
    ];

    for (final step in testCases) {
      final students = step.students;
      final sandwiches = step.sandwiches;
      final expected = step.expected;
      test("\n\tGiven: a queue of students $students, and stack of sandwiches $sandwiches.\n\tThen: there will be $expected hungry students.", () {
        int actual = countStudents(students, sandwiches);
        expect(actual, equals(expected));
      });
    }
  });
}
