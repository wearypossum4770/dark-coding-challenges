import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_max_consecutive_ones.dart';

class FindMaxConsecutiveOnesTestCases {
  List<int> nums;
  int expected;
  FindMaxConsecutiveOnesTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindMaxConsecutiveOnesTestCases([1, 1, 0, 1, 1, 1], 3),
      FindMaxConsecutiveOnesTestCases([1, 0, 1, 1, 0, 1], 2),
      FindMaxConsecutiveOnesTestCases([0], 0),
      FindMaxConsecutiveOnesTestCases([1], 1),
      FindMaxConsecutiveOnesTestCases([1, 1, 1, 1], 4),
    ];

    for (final step in testCases) {
      final expected = step.expected;
      final nums = step.nums;
      test("\n\tGiven: the binary array $nums.\n\tThen it has a maximum of $expected consecutive ones.", () {
        int result = findMaxConsecutiveOnes(nums);
        expect(result, equals(expected));
      });
    }
  });
}
