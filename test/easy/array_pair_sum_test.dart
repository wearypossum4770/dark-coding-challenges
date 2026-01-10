import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/array_pair_sum.dart';

class ArrayPairSumTestCases {
  List<int> nums;
  int expected;
  ArrayPairSumTestCases(this.nums, this.expected);
}

void main() {
  group("\n\tFeature: Array Pair Sum", () {
    final testCases = [
      ArrayPairSumTestCases([1, 4, 3, 2], 4),
      ArrayPairSumTestCases([6, 2, 6, 5, 1, 2], 9),
      ArrayPairSumTestCases([1, 1], 1),
      ArrayPairSumTestCases([0, 0], 0),
      ArrayPairSumTestCases([-1, -1], -1),
      ArrayPairSumTestCases([10_000, 10_000], 10_000),
      ArrayPairSumTestCases([5, 5, 5, 5], 10),
      ArrayPairSumTestCases([7, 7, 7, 7, 7, 7], 21),
      ArrayPairSumTestCases([1, 2, 3, 4, 5, 6], 9),
      ArrayPairSumTestCases([6, 5, 4, 3, 2, 1], 9),
      ArrayPairSumTestCases([-5, -4, -3, -2], -8),
      ArrayPairSumTestCases([-10, -1, 1, 10], -9),
      ArrayPairSumTestCases([-10_000, 10_000, -9_999, 9_999], -1),
      ArrayPairSumTestCases([1, 100, 2, 99, 3, 98], 100 + 3),
      ArrayPairSumTestCases([0, 0, 0, 0, 0, 0], 0),
      ArrayPairSumTestCases([-10_000, 10_000], -10_000),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: the maximum sum of pairs is $expected.", () {
        int actual = arrayPairSum(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
