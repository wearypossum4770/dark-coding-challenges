import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/string_is_subsequence.dart';

class StringIsSubsequenceTestCases {
  String s;
  String t;
  bool expected;
  StringIsSubsequenceTestCases(this.s, this.t, this.expected);
}

void main() {
  group("Feature:", () {
    final sb = StringBuffer();
    sb.write("a");
    sb.write(List.filled(9999, 'x').join());
    sb.write("b");
    sb.write(List.filled(9999, 'y').join());
    sb.write("c");

    final testCases = [
      StringIsSubsequenceTestCases("abc", "ahbgdc", true),
      StringIsSubsequenceTestCases("", "", true),
      StringIsSubsequenceTestCases("", "anything", true),
      StringIsSubsequenceTestCases("a", "a", true),
      StringIsSubsequenceTestCases("a", "b", false),
      StringIsSubsequenceTestCases("z", "abc", false),
      StringIsSubsequenceTestCases("acb", "abc", false),
      StringIsSubsequenceTestCases("xyz", "abcxyz", true),
      StringIsSubsequenceTestCases("aaa", "aaaaaa", true),
      StringIsSubsequenceTestCases("aaa", "aa", false),
      StringIsSubsequenceTestCases("abc", "abc", true),
      StringIsSubsequenceTestCases("abc", sb.toString(), true),
      StringIsSubsequenceTestCases("ace", "abcde", true),
      StringIsSubsequenceTestCases("aec", "abcde", false),
      StringIsSubsequenceTestCases("axc", "ahbgdc", false),
    ];

    for (final step in testCases) {
      final s = step.s;
      final t = step.t;
      final expected = step.expected;

      test("\n\tGiven: the strings s: $s and t: $t.\n\tThen: s is a subsequence of t $expected", () {
        bool result = stringIsSubsequence(s, t);
        expect(result, equals(expected));
      });
    }
  });
}
