import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/top_frequent_words.dart';

class TopFrequentWordsTestCases {
  List<String> words;
  int k;
  List<String> expected;
  TopFrequentWordsTestCases(this.words, this.k, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      TopFrequentWordsTestCases(["i", "love", "leetcode", "i", "love", "coding"], 2, ["i", "love"]),
      TopFrequentWordsTestCases(["i", "love", "leetcode", "i", "love", "coding"], 3, ["i", "love", "coding"]),
      TopFrequentWordsTestCases(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4, ["the", "is", "sunny", "day"]),
      TopFrequentWordsTestCases(["hello", "hello", "hello"], 1, ["hello"]),
      TopFrequentWordsTestCases(["a", "b", "c", "d"], 4, ["a", "b", "c", "d"]),
      TopFrequentWordsTestCases(["apple", "banana", "apple", "banana", "cherry", "cherry"], 3, ["apple", "banana", "cherry"]),
      TopFrequentWordsTestCases(["x", "y", "z"], 1, ["x"]),
      TopFrequentWordsTestCases([], 0, []),
      TopFrequentWordsTestCases(["a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b"], 3, ["aaa", "b", "a"]),
      TopFrequentWordsTestCases(["one", "two"], 2, ["one", "two"]),
    ];

    for (final step in testCases) {
      final words = step.words;
      final k = step.k;
      final expected = step.expected;
      test("\n\tGiven: the list of words $words.\n\tThen: the top $k words are $expected.", () {
        List<String> actual = topFrequentWords(words, k);
        expect(actual.toSet(), equals(expected.toSet()));
      });
    }
  });
}
