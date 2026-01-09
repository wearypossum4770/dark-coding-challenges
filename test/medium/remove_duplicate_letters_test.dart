import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/remove_duplicate_letters.dart';

class RemoveDuplicateLettersTestCases {
  String s;
  String expected;
  RemoveDuplicateLettersTestCases(this.s, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      RemoveDuplicateLettersTestCases("bcabc", "abc"),
      RemoveDuplicateLettersTestCases("cbacdcbc", "acdb"),
      RemoveDuplicateLettersTestCases("a", "a"),
      RemoveDuplicateLettersTestCases("aa", "a"),
      RemoveDuplicateLettersTestCases("aaa", "a"),
      RemoveDuplicateLettersTestCases("ab", "ab"),
      RemoveDuplicateLettersTestCases("ba", "ba"),
      RemoveDuplicateLettersTestCases("abc", "abc"),
      RemoveDuplicateLettersTestCases("cba", "cba"),
      RemoveDuplicateLettersTestCases("abab", "ab"),
      RemoveDuplicateLettersTestCases("baba", "ab"),
      RemoveDuplicateLettersTestCases("bbcaac", "bac"),
      RemoveDuplicateLettersTestCases("cdadabcc", "adbc"),
      RemoveDuplicateLettersTestCases("ecbacba", "eacb"),
      RemoveDuplicateLettersTestCases("leetcode", "letcod"),
      RemoveDuplicateLettersTestCases("bcab", "abc"),
      RemoveDuplicateLettersTestCases("zxyxz", "xyz"),
      RemoveDuplicateLettersTestCases("abcdefghijklmnopqrstuvwxyz", "abcdefghijklmnopqrstuvwxyz"),
      RemoveDuplicateLettersTestCases("zyxwvutsrqponmlkjihgfedcba", "zyxwvutsrqponmlkjihgfedcba"),
      RemoveDuplicateLettersTestCases("aabbccddeeff", "abcdef"),
      RemoveDuplicateLettersTestCases("abababab", "ab"),
      RemoveDuplicateLettersTestCases("bcbcbc", "bc"),
      RemoveDuplicateLettersTestCases("cccbbaaa", "cba"),
      RemoveDuplicateLettersTestCases("dacbacbd", "acbd"),
      RemoveDuplicateLettersTestCases("aaaaabbbbbccccc", "abc"),
    ];

    for (final step in testCases) {
      final s = step.s;
      final expected = step.expected;
      test("\n\tGiven: the string $s.\n\tThen: the lexicographical substring is $expected.", () {
        String actual = removeDuplicateLetters(s);
        expect(actual, equals(expected));
      });
    }
  });
}
