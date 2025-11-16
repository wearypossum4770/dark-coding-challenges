import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/get_array_concatenation.dart';

class GetArrayConcatenationTestCases {
  List<int> nums;
  List<int> expected;
  GetArrayConcatenationTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      GetArrayConcatenationTestCases([1, 2, 1], [1, 2, 1, 1, 2, 1]),
      GetArrayConcatenationTestCases([1, 3, 2, 1], [1, 3, 2, 1, 1, 3, 2, 1]),
      GetArrayConcatenationTestCases([1], [1, 1]),
      GetArrayConcatenationTestCases([1000], [1000, 1000]),
      GetArrayConcatenationTestCases([1, 1, 1], [1, 1, 1, 1, 1, 1]),
      GetArrayConcatenationTestCases([2, 4, 6], [2, 4, 6, 2, 4, 6]),
      GetArrayConcatenationTestCases([5, 10], [5, 10, 5, 10]),
      GetArrayConcatenationTestCases([0, 1, 0], [0, 1, 0, 0, 1, 0]),
      GetArrayConcatenationTestCases([1, 2, 3, 2, 1], [1, 2, 3, 2, 1, 1, 2, 3, 2, 1]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: double and concatenate will be $expected.", () {
        List<int> actual = getArrayConcatenation(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
