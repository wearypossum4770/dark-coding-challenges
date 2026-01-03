import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/repeated_substring_pattern.dart';

class RepeatedSubstringPatternTestCases {
  String s;
  bool expected;
  RepeatedSubstringPatternTestCases(this.s, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      RepeatedSubstringPatternTestCases("a", false),
      RepeatedSubstringPatternTestCases("aa", true),
      RepeatedSubstringPatternTestCases("ab", false),
      RepeatedSubstringPatternTestCases("aba", false),
      RepeatedSubstringPatternTestCases("abab", true),
      RepeatedSubstringPatternTestCases("ababba", false),
      RepeatedSubstringPatternTestCases("abcabc", true),
      RepeatedSubstringPatternTestCases("abcabcabcabc", true),
      RepeatedSubstringPatternTestCases("abcdabcd", true),
      RepeatedSubstringPatternTestCases("abcdabce", false),
      RepeatedSubstringPatternTestCases("aaaaaaaa", true),
      RepeatedSubstringPatternTestCases("aaaaaaab", false),
      RepeatedSubstringPatternTestCases("abaababaab", true),
      RepeatedSubstringPatternTestCases("abaaba", true),
      RepeatedSubstringPatternTestCases("abaabab", false),
      RepeatedSubstringPatternTestCases("xyzxyzxyz", true),
      RepeatedSubstringPatternTestCases("xyzxy", false),
      RepeatedSubstringPatternTestCases("zz", true),
      RepeatedSubstringPatternTestCases("z", false),
      RepeatedSubstringPatternTestCases("ababababx", false),
    ];

    for (final step in testCases) {
      final s = step.s;
      final expected = step.expected;
      test("\n\tGiven: the string $s.\n\tThen: it can be constructed of substrings $expected.", () {
        List<int> actual = repeatedSubstringPattern(s);
        expect(actual, equals(expected));
      });
    }
  });
}
