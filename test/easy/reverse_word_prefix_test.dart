import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reverse_word_prefix.dart';

void main() {
  group("Feature:", () {
    final testCases = [
      ["abcdefd", 'd', "dcbaefd"],
      ["xyxzxe", 'z', "zxyxxe"],
      ["abcd", 'z', "abcd"],
      ["abcde", 'a', "abcde"],
      ["aabcd", 'a', "aabcd"],
      ["abcde", 'e', "edcba"],
      ["a", 'a', "a"],
      ["a", 'b', "a"],
      ["aabcaad", 'a', "aabcaad"],
      ["abacaba", 'c', "cabaaba"],
      ["abcdabcd", 'd', "dcbaabcd"],
      ["dcba", 'a', "abcd"],
      ["ba", 'a', "ab"],
      ["aaaa", 'a', "aaaa"],
      ["aaaa", 'b', "aaaa"],
      ["abcde", 'b', "bacde"],
      ["abcde", 'd', "dcbae"],
      ["ab", 'a', "ab"],
      ["ab", 'b', "ba"],
      ["ab", 'z', "ab"],
      ["racecar", 'e', "ecarcar"],
      ["racecar", 'r', "racecar"],
      ["aabba", 'b', "baaba"],
      ["mnopqrstu", 'u', "utsrqponm"],
      ["абагд", 'а', "абагд"],
      ["а", 'а', "а"],
      ["а", 'б', "а"],
      ["аб", 'а', "аб"],
      ["аааа", 'а', "аааа"],
      ["аааа", 'б', "аааа"],
      ["abcde", 'а', "abcde"],
    ];

    for (final step in testCases) {
      final word = step[0];
      final char = step[1];
      final expected = step[2];
      test("\n\tGiven: the word $word and reverse point of $char.\n\tThen: the transformed word is $expected.", () {
        String actual = reverseWordPrefix(word, char);
        expect(actual, equals(expected));
      });
    }
  });
}
