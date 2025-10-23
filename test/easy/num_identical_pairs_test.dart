import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/num_identical_pairs.dart';

class NumIdenticalPairsTestCases {
  List<int> nums;
  int expected;
  NumIdenticalPairsTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      NumIdenticalPairsTestCases([1, 1, 1, 1], 6),
      NumIdenticalPairsTestCases([1, 2, 3], 0),
      NumIdenticalPairsTestCases([1, 2, 3, 1, 1, 3], 4),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the numbers $nums.\n\tThen: it has $expected good pairs", () {
        int actual = numIdenticalPairs(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
