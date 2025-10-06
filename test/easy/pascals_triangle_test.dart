import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/pascals_triangle.dart';

class PascalsTriangleTestCases {
  int row;
  List<List<int>> expected;
  PascalsTriangleTestCases(this.row, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      PascalsTriangleTestCases(1, [
        [1],
      ]),
      PascalsTriangleTestCases(2, [
        [1],
        [1, 1],
      ]),
      PascalsTriangleTestCases(3, [
        [1],
        [1, 1],
        [1, 2, 1],
      ]),
      PascalsTriangleTestCases(4, [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
      ]),
      PascalsTriangleTestCases(5, [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
        [1, 4, 6, 4, 1],
      ]),
      PascalsTriangleTestCases(6, [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
        [1, 4, 6, 4, 1],
        [1, 5, 10, 10, 5, 1],
      ]),
    ];

    for (final step in testCases) {
      final row = step.row;
      final expected = step.expected;
      test("\n\tGiven: a row count of $row.\n\tThen: the completed triangle is $expected", () {
        List<List<int>> result = pascalsTriangle(row);
        expect(result, equals(expected));
      });
    }
  });
}
