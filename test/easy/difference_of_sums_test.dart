import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/difference_of_sums.dart';

class DifferenceOfSumsTestCases {
  int n;
  int m;
  int expected;
  DifferenceOfSumsTestCases(this.n, this.m, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [DifferenceOfSumsTestCases(10, 3, 19), DifferenceOfSumsTestCases(5, 6, 15), DifferenceOfSumsTestCases(5, 1, -15)];

    for (final step in testCases) {
      final n = step.n;
      final m = step.m;
      final expected = step.expected;
      test("\n\tGiven: the inclusive range of integers [$n, $m].\n\tThen: the difference of the sum of it's divisible and non divisible numbers is $expected", () {
        int actual = differenceOfSums(n, m);
        expect(actual, equals(expected));
      });
    }
  });
}
