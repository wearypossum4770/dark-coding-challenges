import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/sort_array_by_parity_two.dart';

class SortArrayByParityTwoTestCases {
  List<int> nums;
  List<int> expected;
  SortArrayByParityTwoTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SortArrayByParityTwoTestCases([4, 2, 5, 7], [4, 5, 2, 7]),
      SortArrayByParityTwoTestCases([2, 3], [2, 3]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: it is $expected after sorting.", () {
        List<int> actual = sortArrayByParityTwo(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
