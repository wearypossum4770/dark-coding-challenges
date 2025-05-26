import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/two_sum.dart';

class TwoSumTestCase {
  List<int> nums;
  List<int> expected;
  int target;
  TwoSumTestCase(this.nums, this.target, this.expected);
}

void main() {
  group("\n\tFeature: Two Sum Challenge", () {
    final testCases = [
      TwoSumTestCase([2, 7, 11, 15], 9, [0, 1]),
      TwoSumTestCase([3, 3], 6, [0, 1]),
      TwoSumTestCase([3, 3], 0, []),
      TwoSumTestCase([1, 2, 3, 4, 5], 10, []),
      TwoSumTestCase([2, 5, 5, 11], 10, [1, 2]),
    ];

    for (final step in testCases) {
      // Safely cast values to List<int> for nums and expected
      final nums = step.nums;
      final target = step.target;
      final expected = step.expected;

      test("\n\tGiven: the array $nums\x1b[0m.\n\tAnd: the target value \x1B[95m$target\x1b[0m.\n\tThen: it's first sum is the pair $expected\x1b[0m", () {
        List<int> result = twoSum(nums, target);
        expect(result, equals(expected));
      });
    }
  });
}
