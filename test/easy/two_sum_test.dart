import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/two_sum.dart';

class TwoSumTestCase {
  List<int> nums;
  List<int> expected;
  int target;
  TwoSumTestCase(this.nums, this.target, this.expected);
}

void main() {
  group("Feature: Two Sum Challenge", () {
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

      test("Testing sum for $nums with target $target", () {
        List<int> result = twoSum(nums, target);
        expect(result, equals(expected));
      });
    }
  });
}
