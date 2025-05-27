import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reverse_string.dart';

class ReverseStringTestCases {
  List<String> input;
  List<String> expected;
  ReverseStringTestCases(this.input, this.expected);
}

void main() {
  group("\n\tFeature: Reverse a String", () {
    final testCases = [
      ReverseStringTestCases(["h", "e", "l", "l", "o"], ['o', 'l', 'l', 'e', 'h']),
      ReverseStringTestCases(['a', 'b', 'c', 'd'], ['d', 'c', 'b', 'a']),
      ReverseStringTestCases(["z"], ["z"]),
      ReverseStringTestCases([], []),
    ];

    for (final step in testCases) {
      List<String> input = step.input;
      List<String> expected = step.expected;
      test("\n\tGiven a mutable array of string $input\x1b[0m\n\tThen: the array is reversed in-place.", () {
        reverseString(input);
        expect(input, equals(expected));
      });
    }
  });
}
