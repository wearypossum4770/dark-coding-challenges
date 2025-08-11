import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/single_number.dart';

class SingleNumberTestCases {
  List<int> values;
  int expected;
  SingleNumberTestCases(this.values, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      SingleNumberTestCases([2, 2, 1], 1),
      SingleNumberTestCases([4, 1, 2, 1, 2], 4),
      SingleNumberTestCases([1], 1),
    ];

    for (final step in testCases) {
      final values = step.values;
      final expected = step.expected;
      test("\n\tGiven: an array $values.\n\tThen: the non-repeating value is $expected", () {
        int result = singleNumber(values);
        expect(result, equals(expected));
      });
    }
  });
}
