import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_first_palindrome.dart';

class FindFirstPalindromeTestCases {
  List<String> words;
  String expected;
  FindFirstPalindromeTestCases(this.words, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindFirstPalindromeTestCases(["abc", "car", "ada", "racecar", "cool"], "ada"),
      FindFirstPalindromeTestCases(["notapalindrome", "racecar"], "racecar"),
      FindFirstPalindromeTestCases(["def", "ghi"], ""),
    ];

    for (final step in testCases) {
      final words = step.words;
      final expected = step.expected;
      test("\n\tGiven: a list of words $words.\n\tThen: it's first palindrome is $expected.", () {
        String actual = findFirstPalindrome(words);
        expect(actual, equals(expected));
      });
    }
  });
}
