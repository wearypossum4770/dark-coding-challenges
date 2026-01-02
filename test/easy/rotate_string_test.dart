import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/rotate_string.dart';

class RotateStringTestCases {
  String s;
  String goal;
  bool expected;
  RotateStringTestCases(this.s, this.goal, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      RotateStringTestCases("abcde", "cdeab", true),
      RotateStringTestCases("abcde", "eabcd", true),
      RotateStringTestCases("abcde", "abcde", true),
      RotateStringTestCases("abcde", "abced", false),
      RotateStringTestCases("abcde", "edcba", false),
      RotateStringTestCases("aa", "a", false),
      RotateStringTestCases("a", "aa", false),
      RotateStringTestCases("abc", "abcd", false),
      RotateStringTestCases("aaaa", "aaaa", true),
      RotateStringTestCases("aabb", "bbaa", true),
      RotateStringTestCases("aabb", "abab", false),
      RotateStringTestCases("aabb", "abba", true),
      RotateStringTestCases("defdefdefabcabc", "defdefabcabcdef", true),
      RotateStringTestCases("bbbacddceeb", "ceebbbbacdd", true),
      RotateStringTestCases("a", "a", true),
      RotateStringTestCases("a", "b", false),
      RotateStringTestCases("", "", true),
      RotateStringTestCases("abcabc", "bcabca", true),
      RotateStringTestCases("abcabc", "cabacb", false),
    ];

    for (final step in testCases) {
      final s = step.s;
      final goal = step.goal;
      final expected = step.expected;
      test("\n\tGiven: the strings $s and $goal.\n\tThen: the second is a rotation of the first $expected.", () {
        bool actual = rotateString(s, goal);
        expect(actual, equals(expected));
      });
    }
  });
}
