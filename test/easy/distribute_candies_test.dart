import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/distribute_candies.dart';

class DistributeCandiesTestCases {
  String criteria;
  List<int> candies;
  int expected;
  DistributeCandiesTestCases(this.criteria, this.candies, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      DistributeCandiesTestCases("3 unique, can eat 3", [1, 1, 2, 2, 3, 3], 3),
      DistributeCandiesTestCases("3 unique, can eat 2", [1, 1, 2, 3], 2),
      DistributeCandiesTestCases("1 unique, can eat 2 -> only 1 type", [6, 6, 6, 6], 1),
      DistributeCandiesTestCases("6 unique, can eat 3", [1, 2, 3, 4, 5, 6], 3),
      DistributeCandiesTestCases("1 unique", [1, 1], 1),
      DistributeCandiesTestCases("no candies can't eay any", [], 0),
      DistributeCandiesTestCases("<constraint non-conforming> 1 unique, 1 count cannot eat", [1], 0),
      DistributeCandiesTestCases("2 unique, can eat 1", [1, 2], 1),
      DistributeCandiesTestCases("minimum n=2, all same", [1, 1], 1),
      DistributeCandiesTestCases("minimum n=2, all unique", [1, 2], 1),
      DistributeCandiesTestCases("negative values, 2 unique", [-1, -1, 1, 1], 2),
      DistributeCandiesTestCases("boundary values, 2 unique", [100000, 100000, -100000, -100000], 2),
      DistributeCandiesTestCases("mixed positive/negative/zero, 3 unique", [0, 0, -1, 1], 2),
      DistributeCandiesTestCases("large n=10000, all unique", List<int>.generate(10000, (i) => i), 5000),
      DistributeCandiesTestCases("large n=10000, all same", List<int>.filled(10000, 1), 1),
      DistributeCandiesTestCases("n=4, 4 unique", [1, 2, 3, 4], 2),
      DistributeCandiesTestCases("n=8, 3 unique", [1, 1, 1, 1, 2, 2, 3, 3], 3),
    ];

    for (final step in testCases) {
      final candies = step.candies;
      final criteria = step.criteria;
      final expected = step.expected;
      test("\n\tWith: the criteria: $criteria.\n\tGiven: the candies $candies.\n\tThen: it will be $expected.", () {
        int actual = distributeCandies(candies);
        expect(actual, equals(expected));
      });
    }
  });
}
