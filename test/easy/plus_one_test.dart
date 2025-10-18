import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/plus_one.dart';

class PlusOneTestCases {
  List<int> nums;
  List<int> expected;
  PlusOneTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      PlusOneTestCases([4, 3, 2, 1], [4, 3, 2, 2]),
      PlusOneTestCases([1, 2, 3], [1, 2, 4]),
      PlusOneTestCases([9], [1, 0]),
      PlusOneTestCases([9, 9], [1, 0, 0]),
      PlusOneTestCases([0], [1]),
      PlusOneTestCases([5], [6]),
      PlusOneTestCases([9, 9, 9, 9], [1, 0, 0, 0, 0]),
      PlusOneTestCases([9, 9, 8], [9, 9, 9]),
      PlusOneTestCases([1, 0, 0], [1, 0, 1]),
      PlusOneTestCases([8, 9, 9], [9, 0, 0]),
      PlusOneTestCases([0, 9], [1, 0]),
      PlusOneTestCases([1, 9, 9], [2, 0, 0]),
      PlusOneTestCases([9, 9, 9, 9, 9], [1, 0, 0, 0, 0, 0]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: The number $nums.\n\tThen: it is $expected when one is added.", () {
        List<int> actual = plusOne(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
