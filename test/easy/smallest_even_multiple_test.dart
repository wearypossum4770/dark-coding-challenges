import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/smallest_even_multiple.dart';

class SmallestEvenMultipleTestCases {
  int n;
  int expected;
  SmallestEvenMultipleTestCases(this.n, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SmallestEvenMultipleTestCases(1, 2),
      SmallestEvenMultipleTestCases(2, 2),
      SmallestEvenMultipleTestCases(3, 6),
      SmallestEvenMultipleTestCases(4, 4),
      SmallestEvenMultipleTestCases(5, 10),
      SmallestEvenMultipleTestCases(6, 6),
      SmallestEvenMultipleTestCases(7, 14),
      SmallestEvenMultipleTestCases(8, 8),
      SmallestEvenMultipleTestCases(9, 18),
      SmallestEvenMultipleTestCases(10, 10),
      SmallestEvenMultipleTestCases(11, 22),
      SmallestEvenMultipleTestCases(12, 12),
      SmallestEvenMultipleTestCases(13, 26),
      SmallestEvenMultipleTestCases(14, 14),
      SmallestEvenMultipleTestCases(15, 30),
      SmallestEvenMultipleTestCases(16, 16),
      SmallestEvenMultipleTestCases(17, 34),
      SmallestEvenMultipleTestCases(18, 18),
      SmallestEvenMultipleTestCases(19, 38),
      SmallestEvenMultipleTestCases(20, 20),
      SmallestEvenMultipleTestCases(149, 298),
      SmallestEvenMultipleTestCases(150, 150),
      SmallestEvenMultipleTestCases(1, 2),
      SmallestEvenMultipleTestCases(2, 2),
      SmallestEvenMultipleTestCases(150, 150),
      SmallestEvenMultipleTestCases(149, 298),
    ];

    for (final step in testCases) {
      final n = step.n;
      final expected = step.expected;
      test("\n\tGiven: the number $n.\n\tThen the samllest even multiple of it is $expected.", () {
        int actual = smallestEvenMultiple(n);
        expect(actual, equals(expected));
      });
    }
  });
}
