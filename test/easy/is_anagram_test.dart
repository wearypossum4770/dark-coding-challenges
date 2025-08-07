import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/is_anagram.dart';

class IsAnagramTestCases {
  String first;
  String second;
  bool expected;
  IsAnagramTestCases(this.first, this.second, this.expected);
}

class DetectAnagramTestCases {
  List<String> expected;
  String word;
  List<String> candidates;
  String criteria;
  DetectAnagramTestCases(this.expected, this.word, this.candidates, this.criteria);
}

void main() {
  group("\n\tFeature: Is Anagram", () {
    final testCases = [
      IsAnagramTestCases("listen", "silent", true),
      IsAnagramTestCases("evil", "vile", true),
      IsAnagramTestCases("race", "care", true),
      IsAnagramTestCases("anagram", "nagaram", true),
      IsAnagramTestCases("listen", "silent", true),
      IsAnagramTestCases("triangle", "integral", true),
      IsAnagramTestCases("apple", "pale", false),
      IsAnagramTestCases("aacc", "ccac", false),
      IsAnagramTestCases("", "", true),
      IsAnagramTestCases("a", "a", true),
      IsAnagramTestCases("a", "b", false),
      IsAnagramTestCases("aaaaa", "aaaaa", true),
      IsAnagramTestCases("abcd", "abdc", true),
    ];

    for (final step in testCases) {
      final first = step.first;
      final second = step.second;
      final expected = step.expected;
      test("\n\t\tGiven two strings \x1b[38;5;221m'$first'\x1b[0m and \x1b[38;5;221m'$second'\x1b[0m\n\t\tThen: It is expected to be an anagram $expected\x1b[0m", () {
        bool result = isAnagram(first, second);
        expect(result, equals(expected));
      });
    }
  });
}
