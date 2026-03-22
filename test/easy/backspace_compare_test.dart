import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/backspace_compare.dart';

class BackspaceCompareTestCases {
  String s;
  String t;
  bool expected;
  BackspaceCompareTestCases(this.s, this.t, this.expected);
}

void main() {
  group("\nFeature:", () {
    final testCases = [
      BackspaceCompareTestCases("y#fo##f", "y#f#o##f", true),
      BackspaceCompareTestCases("ab#c", "ad#c", true),
      BackspaceCompareTestCases("ab##", "c#d#", true),
      BackspaceCompareTestCases("a#c", "b", false),
      BackspaceCompareTestCases("a", "a", true),
      BackspaceCompareTestCases("a", "b", false),
      BackspaceCompareTestCases("#", "#", true),
      BackspaceCompareTestCases("#a", "a", true),
      BackspaceCompareTestCases("a#", "", true),
      BackspaceCompareTestCases("a#", "#", true),
      BackspaceCompareTestCases("##", "#", true),
      BackspaceCompareTestCases("###", "##", true),
      BackspaceCompareTestCases("a##", "#", true),
      BackspaceCompareTestCases("a##", "", true),
      BackspaceCompareTestCases("a#b", "b", true),
      BackspaceCompareTestCases("a#b", "a", false),
      BackspaceCompareTestCases("abc", "abc", true),
      BackspaceCompareTestCases("abc", "abd", false),
      BackspaceCompareTestCases("ab#c", "ab#c", true),
      BackspaceCompareTestCases("ab##c", "c", true),
      BackspaceCompareTestCases("a#b#c#", "", true),
      BackspaceCompareTestCases("a#b#c#d", "d", true),
      BackspaceCompareTestCases("a#b#c#d", "e", false),
      BackspaceCompareTestCases("#a#b#", "", true),
      BackspaceCompareTestCases("bxj##tw", "bxj##tw", true),
      BackspaceCompareTestCases("bxj##tw", "bxk##tw", true),
      BackspaceCompareTestCases("xywrrmp", "xywrrmu", false),
      BackspaceCompareTestCases("xywrrmp", "xywrrmp", true),
      BackspaceCompareTestCases("a###b", "b", true),
      BackspaceCompareTestCases("a###b", "a", false),
      BackspaceCompareTestCases("####", "", true),
      BackspaceCompareTestCases("####", "####", true),
      BackspaceCompareTestCases("a####", "#", true),
      BackspaceCompareTestCases("ab####", "##", true),
      BackspaceCompareTestCases("nzp#o#g", "b#nzp#o#g", true),
      BackspaceCompareTestCases("bbbextm", "bbb#extm", false),
      BackspaceCompareTestCases("ab#c#", "a", true),
      BackspaceCompareTestCases("a#a#a#", "", true),
      BackspaceCompareTestCases("abc##", "a", true),
      BackspaceCompareTestCases("abc###", "", true),
      BackspaceCompareTestCases("", "#", true),
      BackspaceCompareTestCases("#", "", true),
    ];

    for (final step in testCases) {
      final s = step.s;
      final t = step.t;
      final expected = step.expected;
      test("\n\tGiven: the strings $s and $t.\n\tThen: they are the same after transformation $expected.", () {
        bool actual = backspaceCompare(s, t);
        expect(actual, equals(expected));
      });
    }
  });
}
