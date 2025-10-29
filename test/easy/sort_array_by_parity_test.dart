import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/sort_array_by_parity.dart';

class SortArrayByParityTestCases {
  List<int> nums;
  List<int> expected;
  SortArrayByParityTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SortArrayByParityTestCases([3, 1, 2, 4], [2, 4, 1, 3]),
      SortArrayByParityTestCases([0], [0]),
      SortArrayByParityTestCases([], []),
      SortArrayByParityTestCases([2], [2]),
      SortArrayByParityTestCases([1], [1]),
      SortArrayByParityTestCases([1, 3, 5, 7], [7, 5, 3, 1]),
      SortArrayByParityTestCases([2, 4, 6, 8], [2, 4, 6, 8]),
      SortArrayByParityTestCases([1, 2, 3, 4, 5, 6], [2, 4, 6, 5, 3, 1]),
      SortArrayByParityTestCases([2, 1, 4, 3, 6, 5], [2, 4, 6, 5, 3, 1]),
      SortArrayByParityTestCases([2, 2, 1, 1], [2, 2, 1, 1]),
      SortArrayByParityTestCases([1, 1, 2, 2], [2, 2, 1, 1]),
      SortArrayByParityTestCases([0, 0, 1, 1], [0, 0, 1, 1]),
      SortArrayByParityTestCases([0, 1, 2, 3, 4], [0, 2, 4, 3, 1]),
      SortArrayByParityTestCases([0, 0, 0, 1], [0, 0, 0, 1]),
      SortArrayByParityTestCases([5000, 4999, 2500, 1], [5000, 2500, 1, 4999]),
      SortArrayByParityTestCases([7, 14, 21, 28, 35], [14, 28, 35, 21, 7]),
      SortArrayByParityTestCases([2, 4, 6, 1, 3, 5], [2, 4, 6, 5, 3, 1]),
      SortArrayByParityTestCases([9, 8, 7, 6, 5, 4], [8, 6, 4, 5, 7, 9]),
      SortArrayByParityTestCases([10, 11, 12], [10, 12, 11]),
      SortArrayByParityTestCases([3, 5, 8, 9, 10], [8, 10, 9, 5, 3]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: it is $expected.\n\tWhen: sorted by parity.", () {
        List<int> actual = sortArrayByParity(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
