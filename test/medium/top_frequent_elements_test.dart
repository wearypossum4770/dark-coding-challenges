import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/top_frequent_elements.dart';

class TopFrequentElementsTestCases {
  List<int> nums;
  int k;
  List<int> expected;
  TopFrequentElementsTestCases(this.nums, this.k, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      TopFrequentElementsTestCases([1, 1, 1, 2, 2, 3], 2, [1, 2]),
      TopFrequentElementsTestCases([1], 1, [1]),
      TopFrequentElementsTestCases([1, 2, 1, 2, 1, 2, 3, 1, 3, 2], 2, [1, 2]),
      TopFrequentElementsTestCases([], 0, []),
      TopFrequentElementsTestCases([5], 1, [5]),
      TopFrequentElementsTestCases([1, 1, 1, 1], 1, [1]),
      TopFrequentElementsTestCases([-1, -1], 1, [-1]),
      TopFrequentElementsTestCases([-1, -1, 2, 2, 3], 2, [-1, 2]),
      TopFrequentElementsTestCases([4, 4, 4, 4, 1, 2, 3], 1, [4]),
      TopFrequentElementsTestCases([1, 1, 2, 2, 3, 3], 2, [1, 2]),
      TopFrequentElementsTestCases([3, 0, 1, 0, 1, 3], 3, [0, 1, 3]),
      TopFrequentElementsTestCases([1, 2, 3, 4], 4, [1, 2, 3, 4]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final k = step.k;
      final expected = step.expected;
      test("\n\tGiven: an array of integers $nums.\n\tThen: find the top $k frequencies are $expected. ", () {
        List<int> actual = topFrequentElements(nums, k);
        expect(actual.toSet(), equals(expected.toSet()));
      });
    }
  });
}
