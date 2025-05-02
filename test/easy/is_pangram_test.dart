import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/is_pangram.dart';

class IsPangramTestCases {
  String criteria;
  bool expected;
  String text;
  IsPangramTestCases(this.criteria, this.expected, this.text);
}

void main() {
  group("\n\tFeature: Sentence is Pangram", () {
    final testCases = [
      IsPangramTestCases("empty sentence", false, ""),
      IsPangramTestCases("perfect lower case", true, "abcdefghijklmnopqrstuvwxyz"),
      IsPangramTestCases("only lower case", true, "the quick brown fox jumps over the lazy dog"),
      IsPangramTestCases("missing the letter 'x'", false, "a quick movement of the enemy will jeopardize five gunboats"),
      IsPangramTestCases("missing the letter 'h'", false, "five boxing wizards jump quickly at it"),
      IsPangramTestCases("with underscores", true, "the_quick_brown_fox_jumps_over_the_lazy_dog"),
      IsPangramTestCases("with numbers", true, "the 1 quick brown fox jumps over the 2 lazy dogs"),
      IsPangramTestCases("missing letters replaced by numbers", false, "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"),
      IsPangramTestCases("mixed case and punctuation", true, '"Five quacking Zephyrs jolt my wax bed."'),
      IsPangramTestCases("a-m and A-M are 26 different characters but not a pangram", false, "abcdefghijklm ABCDEFGHIJKLM"),
      IsPangramTestCases("non-alphanumeric printable ASCII", false, " !\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~"),
    ];

    for (final step in testCases) {
      final txt = step.text;
      final expected = step.expected;
      test("\n\tGiven: a string.$txt\n\tThen: determine if it is a pangram.", () {
        bool result = isPangram(txt);
        expect(result, equals(expected));
      });
    }
  });
}
