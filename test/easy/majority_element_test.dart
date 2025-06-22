import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/majority_element.dart';

class MajorityElementTestCases {
  List<int> nums;
  int expected;
  MajorityElementTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      MajorityElementTestCases([2, 1, 2], 2),
      MajorityElementTestCases([100], 100),
      MajorityElementTestCases([2, 1, 1], 1),
      MajorityElementTestCases([2,2,1,1,1,2,2], 2),
      MajorityElementTestCases([3,2,3], 3),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      int result = majorityElement(nums);
      String criteria = "\n\tGiven: an array $nums.\n\tWhen: the mode is calculated.\n\tThen: it should be $expected.\n\tReceived: $result";
      test(criteria, () {
        expect(result, equals(expected));
      });
    }
  });
}
