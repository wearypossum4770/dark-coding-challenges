import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/number_of_steps_to_zero.dart';

class NumberOfStepsToZeroTestCases {
  int n;
  int expected;
  NumberOfStepsToZeroTestCases(this.n, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      NumberOfStepsToZeroTestCases(2, 2),
      NumberOfStepsToZeroTestCases(0, 0),
      NumberOfStepsToZeroTestCases(1, 1),
      NumberOfStepsToZeroTestCases(8, 4),
      NumberOfStepsToZeroTestCases(14, 6),
      NumberOfStepsToZeroTestCases(123, 12),
      NumberOfStepsToZeroTestCases(1_000_000, 26),
      NumberOfStepsToZeroTestCases(-1, 0),
      NumberOfStepsToZeroTestCases(999_999, 31),
    ];

    for (final step in testCases) {
      final n = step.n;
      final expected = step.expected;

      test("\n\tGiven: the integer $n.\n\tThen: it will take $expected steps to reduce it to zero.", () {
        int result = numberOfStepsToZero(n);
        expect(result, equals(expected));
      });
    }
  });
}
