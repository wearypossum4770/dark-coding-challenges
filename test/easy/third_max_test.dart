import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/third_max.dart';

class ThirdMaxTestCases {
  List<int> nums;
  int expected;
  ThirdMaxTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ThirdMaxTestCases([1, 2, 3, 4, 5], 3),
      ThirdMaxTestCases([5, 4, 3, 2, 1], 3),
      ThirdMaxTestCases([10, 20, 30, 40], 20),
      ThirdMaxTestCases([3, 2, 1], 1),
      ThirdMaxTestCases([5, 5, 3, 2], 3),
      ThirdMaxTestCases([1, 2, 2, 3, 3], 1),
      ThirdMaxTestCases([-1, -2, -3, -4], -3),
      ThirdMaxTestCases([-10, -20, -30], -30),
      ThirdMaxTestCases([-10, 0, 10], -10),
      ThirdMaxTestCases([0, -1, 1, 2], 0),
      ThirdMaxTestCases([4, 4, 4, 3, 3, 2], 2),
      ThirdMaxTestCases([-5, -1, -3], -3),
      ThirdMaxTestCases([-2, -1, 0, 1, 2], 0),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: the third largest integer is $expected.", () {
        int actual = thirdMax(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
