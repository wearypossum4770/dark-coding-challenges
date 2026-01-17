import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/smallest_trimmed_numbers.dart';

class SmallestTrimmedNumbersTestCases {
  List<String> nums;
  List<List<int>> queries;
  List<int> expected;
  SmallestTrimmedNumbersTestCases(this.nums, this.queries, this.expected);
}

void main() {
  group("\n\tFeature: Smallest Trimmed Numbers", () {
    final testCases = [
      SmallestTrimmedNumbersTestCases(
        ["102", "473", "251", "814"],
        // dart format off
        [[1, 1], [2, 3], [4, 2], [1, 2]],
        // dart format on
        [2, 2, 1, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["24", "37", "96", "04"],
        // dart format off
        [[2, 1], [2, 2]],
        // dart format on
        [3, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["000", "000", "000", "000"],
        // dart format off
        [[1, 1], [2, 1], [3, 1], [4, 1]],
        // dart format on
        [0, 1, 2, 3],
      ),
      SmallestTrimmedNumbersTestCases(
        ["0", "0", "0", "0"],
        // dart format off
        [[1, 1], [2, 1], [3, 1], [4, 1]],
        // dart format on
        [0, 1, 2, 3],
      ),
      SmallestTrimmedNumbersTestCases(
        ["123456789", "987654321", "111111111", "000000000"],
        // dart format off
        [[1, 9], [2, 9], [3, 9], [4, 9]],
        // dart format on
        [3, 2, 0, 1],
      ),
      SmallestTrimmedNumbersTestCases(
        ["9", "8", "7", "6", "5", "4", "3", "2", "1", "0"],
        // dart format off
        [[1, 1], [5, 1], [10, 1]],
        // dart format on
        [9, 5, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["100", "200", "300", "400", "500"],
        // dart format off
        [[1, 2], [2, 2], [3, 2], [4, 2], [5, 2]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["00100", "00101", "00110", "00111", "01000"],
        // dart format off
        [[1, 3], [2, 3], [3, 3], [4, 3], [5, 3]],
        // dart format on
        [4, 0, 1, 2, 3],
      ),
      SmallestTrimmedNumbersTestCases(
        ["99999", "99998", "99997", "99996", "99995"],
        // dart format off
        [[1, 5], [2, 5], [3, 5], [4, 5], [5, 5]],
        // dart format on
        [4, 3, 2, 1, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["00001", "00010", "00100", "01000", "10000"],
        // dart format off
        [[1, 5], [2, 5], [3, 5], [4, 5], [5, 5]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["123", "123", "123", "123", "123"],
        // dart format off
        [[1, 3], [2, 3], [3, 3], [4, 3], [5, 3]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["000", "001", "002", "010", "100"],
        // dart format off
        [[1, 3], [2, 3], [3, 3], [4, 3], [5, 3]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["9876543210", "8765432109", "7654321098", "6543210987", "5432109876"],
        // dart format off
        [[1, 10], [3, 10], [5, 10]],
        // dart format on
        [4, 2, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["1", "10", "100", "1000", "10000"],
        // dart format off
        [[1, 5], [2, 5], [3, 5], [4, 5], [5, 5]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["999", "998", "997", "996", "995", "994", "993", "992", "991", "990"],
        // dart format off
        [[1, 3], [5, 3], [10, 3]],
        // dart format on
        [9, 5, 0],
      ),
      SmallestTrimmedNumbersTestCases(
        ["0000000000", "0000000001", "0000000010", "0000000100", "0000001000"],
        // dart format off
        [[1, 10], [2, 10], [3, 10], [4, 10], [5, 10]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["1111111111", "2222222222", "3333333333", "4444444444", "5555555555"],
        // dart format off
        [[1, 10], [2, 10], [3, 10], [4, 10], [5, 10]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["1000000000", "999999999", "999999998", "999999997", "999999996"],
        // dart format off
        [[1, 10], [2, 10], [3, 10]],
        // dart format on
        [0, 4, 3],
      ),
      SmallestTrimmedNumbersTestCases(
        ["000", "001", "010", "100", "999"],
        // dart format off
        [[1, 3], [2, 3], [3, 3], [4, 3], [5, 3]],
        // dart format on
        [0, 1, 2, 3, 4],
      ),
      SmallestTrimmedNumbersTestCases(
        ["000000", "000001", "000010", "000100", "001000", "010000", "100000"],
        // dart format off
        [[1, 6], [3, 6], [5, 6], [7, 6]],
        // dart format on
        [0, 2, 4, 6],
      ),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final queries = step.queries;
      final expected = step.expected;
      test("\n\tGiven: the numbers $nums and queries $queries.\n\tThen: the indices are $expected.", () {
        List<int> actual = smallestTrimmedNumbers(nums, queries);
        expect(actual, equals(expected));
      });
    }
  });
}
