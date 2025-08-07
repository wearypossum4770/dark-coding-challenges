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
  group("\n\tFeature: Detect Anagram from list", () {
    final testCases = [
      DetectAnagramTestCases(["gallery", "regally", "largely"], "allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"], "detects three anagrams"),
      DetectAnagramTestCases(["inlets"], "listen", ["enlists", "google", "inlets", "banana"], "detects anagram"),
      DetectAnagramTestCases([], "good", ["dog", "goody"], "does not detect anagram subsets"),
      DetectAnagramTestCases(["lemons", "melons"], "solemn", ["lemons", "cherry", "melons"], "detects two anagrams"),
      DetectAnagramTestCases([], "diaper", ["hello", "world", "zombies", "pants"], "no matches"),
      DetectAnagramTestCases(["Eons", "ONES"], "nose", ["Eons", "ONES"], "detects multiple anagrams with different case"),
      DetectAnagramTestCases([], "mass", ["last"], "does not detect non-anagrams with identical checksum"),
      DetectAnagramTestCases(["Carthorse"], "Orchestra", ["cashregister", "Carthorse", "radishes"], "detects anagrams case-insensitively"),
      DetectAnagramTestCases(["carthorse"], "Orchestra", ["cashregister", "carthorse", "radishes"], "detects anagrams using case-insensitive subject"),
      DetectAnagramTestCases(["Carthorse"], "orchestra", ["cashregister", "Carthorse", "radishes"], "detects anagrams using case-insensitive possible matches"),
      DetectAnagramTestCases([], "go", ["goGoGO"], "does not detect an anagram if the original word is repeated"),
      DetectAnagramTestCases([], "tapper", ["patter"], "anagrams must use all letters exactly once"),
      DetectAnagramTestCases([], "BANANA", ["BANANA"], "words are not anagrams of themselves"),
      DetectAnagramTestCases([], "BANANA", ["Banana"], "words are not anagrams of themselves even if letter case is partially different"),
      DetectAnagramTestCases([], "BANANA", ["banana"], "words are not anagrams of themselves even if letter case is completely different"),
      DetectAnagramTestCases(["Silent"], "LISTEN", ["LISTEN", "Silent"], "words other than themselves can be anagrams"),
    ];
    for (final step in testCases) {
      final expected = step.expected;
      final word = step.word;
      final candidates = step.candidates;
      final criteria = step.criteria;
      test("\n\tGiven: the string \x1b[38;5;221m'$word'\x1b[0m\nAnd: array $candidates\n\tWhen feed to detectAnagrams\n\tThen: it returns $expected", () {
        List<String> result = detectAnagram(word, candidates);
        expect(result, equals(expected));
      });
    }
  });
}
