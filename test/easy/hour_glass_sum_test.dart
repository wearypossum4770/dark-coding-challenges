import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/hour_glass_sum.dart';

class HourGlassSumTestCases {
  List<List<int>> matrix;
  int expected;
  HourGlassSumTestCases(this.matrix, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      HourGlassSumTestCases([
        [1, 1, 1, 0, 0, 0],
        [0, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 9, 2, -4, -4, 0],
        [0, 0, 0, -2, 0, 0],
        [0, 0, -1, -2, -4, 0],
      ], 13),
      HourGlassSumTestCases([
        [-1, -1, 0, -9, -2, -2],
        [-2, -1, -6, -8, -2, -5],
        [-1, -1, -1, -2, -3, -4],
        [-1, -9, -2, -4, -4, -5],
        [-7, -3, -3, -2, -9, -9],
        [-1, -3, -1, -2, -4, -5],
      ], -6),
      HourGlassSumTestCases([
        [7, 6, 8, 2, 4, 3],
        [7, 3, 3, 0, 6, 1],
        [3, 8, 7, 7, 2, 2],
        [0, 8, 6, 8, 6, 1],
        [7, 1, 6, 0, 2, 4],
        [2, 7, 8, 1, 7, 4],
      ], 44),
      HourGlassSumTestCases([
        [3, 7, -3, 0, 1, 8],
        [1, -4, -7, -8, -6, 5],
        [-8, 1, 3, 3, 5, 7],
        [-2, 4, 3, 1, 2, 7],
        [2, 4, -5, 1, 8, 4],
        [5, -7, 6, 5, 2, 8],
      ], 33),
      HourGlassSumTestCases([
        [0, 6, -7, 1, 6, 3],
        [-8, 2, 8, 3, -2, 7],
        [-3, 3, -6, -3, 0, -6],
        [5, 0, 5, -1, -5, 2],
        [6, 2, 8, 1, 3, 0],
        [8, 5, 0, 4, -7, 4],
      ], 25),
      HourGlassSumTestCases([
        [0, -4, -6, 0, -7, -6],
        [-1, -2, -6, -8, -3, -1],
        [-8, -4, -2, -8, -8, -6],
        [-3, -1, -2, -5, -7, -4],
        [-3, -5, -3, -6, -6, -6],
        [-3, -6, 0, -8, -6, -7],
      ], -19),
      HourGlassSumTestCases([
        [1, 1, 1, 0, 0, 0],
        [0, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 0, 2, 4, 4, 0],
        [0, 0, 0, 2, 0, 0],
        [0, 0, 1, 2, 4, 0],
      ], 19),
      HourGlassSumTestCases([
        [-1, 1, -1, 0, 0, 0],
        [0, -1, 0, 0, 0, 0],
        [-1, -1, -1, 0, 0, 0],
        [0, -9, 2, -4, -4, 0],
        [-7, 0, 0, -2, 0, 0],
        [0, 0, -1, -2, -4, 0],
      ], 0),
    ];

    for (final step in testCases) {
      final matrix = step.matrix;
      final expected = step.expected;
      test("\n\tGiven: the matrix $matrix.\n\tThen: the min hourglass sum is $expected.", () {
        int actual = hourGlassSum(matrix);
        expect(actual, equals(expected));
      });
    }
  });
}
