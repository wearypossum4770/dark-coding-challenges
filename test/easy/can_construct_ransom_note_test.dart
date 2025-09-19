import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/can_construct_ransom_note.dart';

class CanConstructRansomNoteTestCases {
  String note;
  String magazine;
  bool expected;
  CanConstructRansomNoteTestCases(this.note, this.magazine, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      CanConstructRansomNoteTestCases("a", "b", false),
      CanConstructRansomNoteTestCases("aa", "aab", true),
      CanConstructRansomNoteTestCases("a", "a", true),
      CanConstructRansomNoteTestCases("aa", "ab", false),
      CanConstructRansomNoteTestCases("abc", "cbad", true),
      CanConstructRansomNoteTestCases("", "anything", true),
      CanConstructRansomNoteTestCases("a", "", false),
      CanConstructRansomNoteTestCases("", "", true),
      CanConstructRansomNoteTestCases("aA", "aa", true),
      CanConstructRansomNoteTestCases("Aa", "aA", true),
      CanConstructRansomNoteTestCases("zzz", "zzzzzz", true),
      CanConstructRansomNoteTestCases("zzzz", "zzz", false),
      CanConstructRansomNoteTestCases("hello world", "dlrow olleh", true),
    ];

    for (final step in testCases) {
      final note = step.note;
      final magazine = step.magazine;
      final expected = step.expected;
      test("\n\tGiven: a strings $note and $magazine.\n\tThen: first is a subset of the second $expected", () {
        bool result = canConstructRansomNote(note, magazine);
        expect(result, equals(expected));
      });
    }
  });
}
