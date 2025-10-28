import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reverse_vowels.dart';

class ReverseVowelsTestCases {
  String word;
  String expected;
  ReverseVowelsTestCases(this.word, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ReverseVowelsTestCases("IceCreAm", "AceCreIm"),
      ReverseVowelsTestCases("leetcode", "leotcede"),
      ReverseVowelsTestCases("a", "a"),
      ReverseVowelsTestCases("b", "b"),
      ReverseVowelsTestCases("AEIOU", "UOIEA"),
      ReverseVowelsTestCases("aeiou", "uoiea"),
      ReverseVowelsTestCases("bcdfgh", "bcdfgh"),
      ReverseVowelsTestCases("aA", "Aa"),
      ReverseVowelsTestCases("a.b,e", "e.b,a"),
      ReverseVowelsTestCases("hello world", "hollo werld"),
      ReverseVowelsTestCases("aEiOu", "uOiEa"),
      ReverseVowelsTestCases(".,?!", ".,?!"),
      ReverseVowelsTestCases("aaaaaa", "aaaaaa"),
      ReverseVowelsTestCases("aAaaAa", "aAaaAa"),
    ];

    for (final step in testCases) {
      final word = step.word;
      final expected = step.expected;
      test("\n\tGiven: the word $word.\n\tThen: after reversed vowels $expected.", () {
        String actual = reverseVowels(word);
        expect(actual, equals(expected));
      });
    }
  });
}
