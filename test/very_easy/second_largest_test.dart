import 'package:test/test.dart';
import 'package:dark_coding_challenges/very_easy/second_largest.dart';

class SecondLargestTestCases {
  List<int> nums;
  int expected;
  SecondLargestTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SecondLargestTestCases([10, 40, 30, 20, 50], 40),
      SecondLargestTestCases([25, 143, 89, 13, 105], 105),
      SecondLargestTestCases([54, 23, 11, 17, 10], 23),
      SecondLargestTestCases([513, 211, 131, 417, 11], 417),
      SecondLargestTestCases([63, 44, 11, 22, 33, 66, 65], 65),
      SecondLargestTestCases([5, 5, 3], 3),
      SecondLargestTestCases([5, 5, 5, 4], 4),
      SecondLargestTestCases([1, 2, 2, 1], 1),
      SecondLargestTestCases([3, 3, 2, 2, 1], 2),
      SecondLargestTestCases([-1, -2, -3], -2),
      SecondLargestTestCases([-10, -20, -30, -40], -20),
      SecondLargestTestCases([-5, -1, -3], -3),
      SecondLargestTestCases([-10, 0, 10], 0),
      SecondLargestTestCases([0, -1, 1], 0),
      SecondLargestTestCases([-1, -1, 0], -1),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the list of integers $nums.\n\tThen: the second largest is $expected.", () {
        int actual = secondLargest(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
