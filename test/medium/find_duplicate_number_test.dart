import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/find_duplicate_number.dart';

class FindDuplicateNumberTestCases {
  List<int> nums;
  int expected;
  FindDuplicateNumberTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindDuplicateNumberTestCases([1, 1], 1),
      FindDuplicateNumberTestCases([1, 3, 4, 2, 2], 2),
      FindDuplicateNumberTestCases([3, 1, 3, 4, 2], 3),
      FindDuplicateNumberTestCases([3, 3, 3, 3, 3], 3),
      FindDuplicateNumberTestCases([2, 1, 2], 2),
      FindDuplicateNumberTestCases([1, 4, 6, 3, 2, 5, 6], 6),
      FindDuplicateNumberTestCases([5, 4, 3, 2, 1, 5], 5),
      FindDuplicateNumberTestCases([1, 2, 3, 4, 5, 6, 7, 8, 9, 9], 9),
      FindDuplicateNumberTestCases([2, 2, 2, 2, 2], 2),
      FindDuplicateNumberTestCases([1, 1, 2, 3, 4, 5], 1),
      FindDuplicateNumberTestCases([4, 3, 1, 4, 2], 4),
      FindDuplicateNumberTestCases([6, 1, 5, 4, 3, 2, 6], 6),
      FindDuplicateNumberTestCases([1, 2, 3, 4, 5, 3], 3),
      FindDuplicateNumberTestCases([7, 6, 5, 4, 3, 2, 1, 7], 7),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: the the duplicate is $expected.", () {
        int actual = findDuplicateNumber(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
