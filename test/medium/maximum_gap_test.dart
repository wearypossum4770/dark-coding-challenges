import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/maximum_gap.dart';

class MaximumGapTestCases {
  List<int> nums;
  int expected;
  MaximumGapTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      MaximumGapTestCases([3, 6, 9, 1], 3),
      MaximumGapTestCases([10], 0),
      MaximumGapTestCases([1, 100], 99),
      MaximumGapTestCases([1, 2, 3, 4, 5], 1),
      MaximumGapTestCases([10, 9, 8, 7], 1),
      MaximumGapTestCases([7, 7, 7, 7], 0),
      MaximumGapTestCases([0, 1_000_000_000], 1_000_000_000),
      MaximumGapTestCases([1, 100, 2, 50_000_000], 49_999_900),
      MaximumGapTestCases([1, 1], 0),
      MaximumGapTestCases([2, 2, 2, 3], 1),
      MaximumGapTestCases([100, 3, 2, 1], 97),
      MaximumGapTestCases([1, 3, 1_000, 2_000], 1_000),
      MaximumGapTestCases([8, 1, 6, 3, 9], 3),
      MaximumGapTestCases([5, 4, 3, 2, 1], 1),
      MaximumGapTestCases([1, 2], 1),
      MaximumGapTestCases([1_000_000_000, 0, 999_999_999], 999_999_999),
      MaximumGapTestCases([1, 4, 7, 13, 20, 21], 7),
      MaximumGapTestCases([5, 5, 5, 10], 5),
      MaximumGapTestCases([0, 1, 2, 3, 100], 97),
      MaximumGapTestCases([100, 200, 300, 1_000], 700),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven the array $nums.\n\tThen: the maximum gap among the several sorted elements is $expected.", () {
        int actual = maximumGap(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
