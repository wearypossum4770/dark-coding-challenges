import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_words_containing.dart';

class FindWordsContainingTestCases {
  List<String> words;
  String c;
  List<int> expected;
  FindWordsContainingTestCases(this.words, this.c, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindWordsContainingTestCases(["abc", "bcd", "aaaa", "cbc"], "a", [0, 2]),
      FindWordsContainingTestCases(["leet", "code"], "e", [0, 1]),
      FindWordsContainingTestCases(["abc", "bcd", "aaaa", "cbc"], "z", []),
    ];

    for (final step in testCases) {
      final words = step.words;
      final c = step.c;
      final expected = step.expected;
      test("", () {
        List<int> actual = findWordsContaining(words, c);
        expect(actual, equals(expected));
      });
    }
  });
}
