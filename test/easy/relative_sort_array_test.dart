import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/relative_sort_array.dart';

class RelativeSortArrayTestCases {
  List<int> arr1;
  List<int> arr2;
  List<int> expected;
  RelativeSortArrayTestCases(this.arr1, this.arr2, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      RelativeSortArrayTestCases([2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19], [2, 1, 4, 3, 9, 6], [2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19]),
      RelativeSortArrayTestCases([28, 6, 22, 8, 44, 17], [22, 28, 8, 6], [22, 28, 8, 6, 17, 44]),
      RelativeSortArrayTestCases([5, 3, 8, 1, 9, 2], [], [1, 2, 3, 5, 8, 9]),
      RelativeSortArrayTestCases([5, 5, 2, 2, 8, 8], [2, 5, 8], [2, 2, 5, 5, 8, 8]),
      RelativeSortArrayTestCases([42], [42], [42]),
      RelativeSortArrayTestCases([100, 1, 100, 2], [1, 2], [1, 2, 100, 100]),
      RelativeSortArrayTestCases([3, 3, 3, 3, 3], [3], [3, 3, 3, 3, 3]),
      RelativeSortArrayTestCases([0], [0], [0]),
      RelativeSortArrayTestCases([], [1, 2, 3], []),
      RelativeSortArrayTestCases([7, 1, 7, 1, 7], [7, 1], [7, 7, 7, 1, 1]),
      RelativeSortArrayTestCases([999, 0, 500, 1000, 0], [0, 1000], [0, 0, 1000, 500, 999]),
      RelativeSortArrayTestCases([1, 2, 3, 4, 5], [5, 4, 3, 2, 1], [5, 4, 3, 2, 1]),
    ];

    for (final step in testCases) {
      final arr1 = step.arr1;
      final arr2 = step.arr2;
      final expected = step.expected;
      test("\n\tGiven: the array $arr1 and a sorting order of $arr2.\n\tThen: the sorted results are $expected.", () {
        List<int> actual = relativeSortArray(arr1, arr2);
        expect(actual, equals(expected));
      });
    }
  });
}
