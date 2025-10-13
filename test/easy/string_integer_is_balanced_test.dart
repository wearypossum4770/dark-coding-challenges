import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/string_integer_is_balanced.dart';

class StringIntegerIsBalancedTestCases {
  String n;
  bool expected;
  StringIntegerIsBalancedTestCases(this.n, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      StringIntegerIsBalancedTestCases("12", false),
      StringIntegerIsBalancedTestCases("11", true),
      StringIntegerIsBalancedTestCases("1234", false),
      StringIntegerIsBalancedTestCases("24123", true),
      StringIntegerIsBalancedTestCases("00", true),
      StringIntegerIsBalancedTestCases("10", false),
      StringIntegerIsBalancedTestCases("1010", false),
      StringIntegerIsBalancedTestCases("909", false),
      StringIntegerIsBalancedTestCases("1234567890", false),
      StringIntegerIsBalancedTestCases("111111", true),
      StringIntegerIsBalancedTestCases("123321", true),
      StringIntegerIsBalancedTestCases("99999999", true),
      StringIntegerIsBalancedTestCases("5005", true),
      StringIntegerIsBalancedTestCases("1234567", false),
      StringIntegerIsBalancedTestCases("1", false),
    ];

    for (final step in testCases) {
      final n = step.n;
      final expected = step.expected;
      test("\n\tGiven: the integer string $n.\n\tThen: the sum of even and odd indices are equal $expected.", () {
        bool actual = stringIntegerIsBalanced(n);
        expect(actual, equals(expected));
      });
    }
  });
}
