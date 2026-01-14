import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/sort_array.dart';

class SortArrayTestCases {
  List<int> nums;
  List<int> expected;
  SortArrayTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SortArrayTestCases([5, 1, 1, 2, 0, 0], [0, 0, 1, 1, 2, 5]),
      SortArrayTestCases([5, 2, 3, 1], [1, 2, 3, 5]),
      SortArrayTestCases([1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]),
      SortArrayTestCases([5, 5, 5, 5], [5, 5, 5, 5]),
      SortArrayTestCases([1], [1]),
      SortArrayTestCases([-1, 0, 1], [-1, 0, 1]),
      SortArrayTestCases([7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7], [7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]),
      SortArrayTestCases([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
      SortArrayTestCases([-50000, 50000, -49999, 49999], [-50000, -49999, 49999, 50000]),
      SortArrayTestCases([10, 20, 30, 40, 50, 80, 60, 70, 90, 100, 120, 110], [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]),
      SortArrayTestCases([100, 90, 80, 70, 60, 50, 40, 30, 20, 10], [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]),
      SortArrayTestCases([50000, 49999, 49998, -50000, -49999, -49998, 0, 1, -1, 2, -2], [-50000, -49999, -49998, -2, -1, 0, 1, 2, 49998, 49999, 50000]),
      SortArrayTestCases([-50000, -50000, -50000, -50000, -50000, 50000, 50000, 50000, 50000, 50000], [-50000, -50000, -50000, -50000, -50000, 50000, 50000, 50000, 50000, 50000]),
      SortArrayTestCases([1, 2, 3, 4, 5, 6, 7, -1], [-1, 1, 2, 3, 4, 5, 6, 7]),
      SortArrayTestCases([1, 2, 3, 4, 5], [1, 2, 3, 4, 5]),
      SortArrayTestCases(
        [0, 0, 0, 0, 1, 1, -1, -1, 2, 2, -2, -2, 0, 3, -3, 3, -3, 0, 1, -1, 2, -2, 0],
        [-3, -3, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3],
      ),
      SortArrayTestCases(
        [4, -7, 2, 11, -3, 0, 9, 5, -12, 8, 1, -6, 3, -1, 10, -4, 7, 13, -8, 6, -2, 12, -5, 9],
        [-12, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 12, 13],
      ),
      SortArrayTestCases(
        [-42, 17, 99, -88, 0, 33, 76, -15, 61, 23, -71, 8, 54, -29, 92, -3, 47, -66],
        [-88, -71, -66, -42, -29, -15, -3, 0, 8, 17, 23, 33, 47, 54, 61, 76, 92, 99],
      ),
      SortArrayTestCases([50000, -50000, 50000, -50000, 0], [-50000, -50000, 0, 50000, 50000]),
      SortArrayTestCases([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]),
      SortArrayTestCases([-50000, 50000, -50000, 50000, -50000], [-50000, -50000, -50000, 50000, 50000]),
      SortArrayTestCases([], []),
      SortArrayTestCases([-50000], [-50000]),
      SortArrayTestCases([1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]),
      SortArrayTestCases([5], [5]),
      SortArrayTestCases([-4, -1, 0, 2, 5], [-4, -1, 0, 2, 5]),
      SortArrayTestCases([10, 8, 6, 4, 2, 1, 3, 5, 7, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
      SortArrayTestCases([50000, -50000, 0, 49999, -49999], [-50000, -49999, 0, 49999, 50000]),
      SortArrayTestCases([-50000, 50000, 0, -49999, 49999], [-50000, -49999, 0, 49999, 50000]),
      SortArrayTestCases([], []),
      SortArrayTestCases([1, 2, 3, 4], [1, 2, 3, 4]),
      SortArrayTestCases([42], [42]),
      SortArrayTestCases([], []),
      SortArrayTestCases([1], [1]),
      SortArrayTestCases([-50000], [-50000]),
      SortArrayTestCases([50000], [50000]),
      SortArrayTestCases([7, 7, 7, 7, 7], [7, 7, 7, 7, 7]),
      SortArrayTestCases([-1, 0, 1], [-1, 0, 1]),
      SortArrayTestCases([4, -7, 11, 2, -3, 0, 9, 5, -12, 8], [-12, -7, -3, 0, 2, 4, 5, 8, 9, 11]),
      SortArrayTestCases([0, 0, 0, 1, -1, 2, -2, 0], [-2, -1, 0, 0, 0, 0, 1, 2]),
      SortArrayTestCases([1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: it is $expected after sorting.", () {
        List<int> actual = sortArray(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
