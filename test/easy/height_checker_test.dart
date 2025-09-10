import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/height_checker.dart';

class HeightCheckerTestCases {
  List<int> nums;
  int expected;
  HeightCheckerTestCases(this.nums, this.expected);
}

void main() {
  group("\n\tFeature:", () {
    final testCases = [
      HeightCheckerTestCases([1, 1, 4, 2, 1, 3], 3),
      HeightCheckerTestCases([5, 1, 2, 3, 4], 5),
      HeightCheckerTestCases([1, 2, 3, 4, 5], 0),
      HeightCheckerTestCases([10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7], 22),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\nt\tGiven: the list of students heights $nums.\n\tThen: it has $expected mis-aligned elements.", () {
        int result = heightChecker(nums);
        expect(result, equals(expected));
      });
    }
  });
}
