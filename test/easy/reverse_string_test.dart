import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reverse_string.dart';

class ReverseStringTestCases {
  List<String> input;
  List<String> expected;
  ReverseStringTestCases(this.input, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ReverseStringTestCases(
        ["h", "e", "l", "l", "o"],
        ['o', 'l', 'l', 'e', 'h'],
      ),
      ReverseStringTestCases(['a', 'b', 'c', 'd'], ['d', 'c', 'b', 'a']),
      ReverseStringTestCases(["z"], ["z"]),
      ReverseStringTestCases([], []),
    ];

    for (final step in testCases) {
      List<String> input = step.input;
      List<String> expected = step.expected;
      test(
        "Given a mutable array of string $input\nThen: the array is reversed in-place.",
        () {
          reverseString(input);
          expect(input, equals(expected));
        },
      );
    }
  });
}
