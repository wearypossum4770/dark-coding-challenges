import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/detect_capital_use.dart';

class DetectCapitalUseTestCases {
  String word;
  bool expected;
  DetectCapitalUseTestCases(this.word, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      DetectCapitalUseTestCases("USA", true),
      DetectCapitalUseTestCases("UsA", false),
      DetectCapitalUseTestCases("leetcode", true),
      DetectCapitalUseTestCases("Google", true),
      DetectCapitalUseTestCases("FlaG", false),
      DetectCapitalUseTestCases("g", true),
      DetectCapitalUseTestCases("G", true),
      DetectCapitalUseTestCases("LeetCode", false),
      DetectCapitalUseTestCases("aPPle", false),
      DetectCapitalUseTestCases("APPLE", true),
      DetectCapitalUseTestCases("apple", true),
      DetectCapitalUseTestCases("Apple", true),
      DetectCapitalUseTestCases("AppLe", false),
      DetectCapitalUseTestCases("zZZ", false),
      DetectCapitalUseTestCases("HELlo", false),
      DetectCapitalUseTestCases("qwerty", true),
      DetectCapitalUseTestCases("Qwerty", true),
      DetectCapitalUseTestCases("QWERTY", true),
      DetectCapitalUseTestCases("QwErTy", false),
      DetectCapitalUseTestCases("Abcdefg", true),
      DetectCapitalUseTestCases("abcdEfg", false),
    ];

    for (final step in testCases) {
      final word = step.word;
      final expected = step.expected;
      test("\n\tGiven: the string $word.\n\tThen: it has acceptable casing $expected.", () {
        bool actual = detectCapitalUse(word);
        expect(actual, equals(expected));
      });
    }
  });
}
