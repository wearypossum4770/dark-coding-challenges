import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/roman_to_int.dart';

class RomanToIntTestCases {
  String roman;
  int arabic;
  RomanToIntTestCases(this.roman, this.arabic);
}

void main() {
  group("\n\tFeature: Roman Arabic Integer", () {
    final testCases = [
      RomanToIntTestCases("IV", 4),
      RomanToIntTestCases("XC", 90),
      RomanToIntTestCases("CM", 900),
      RomanToIntTestCases("MMM", 3_000),
      RomanToIntTestCases("III", 3),
      RomanToIntTestCases("XXVII", 27),
      RomanToIntTestCases("LVIII", 58),
      RomanToIntTestCases("MCMXCIV", 1_994),
      RomanToIntTestCases("MMMCMXCIV", 3_994),
      RomanToIntTestCases("I", 1),
      RomanToIntTestCases("VIII", 8),
      RomanToIntTestCases("XXIX", 29),
      RomanToIntTestCases("LIV", 54),
      RomanToIntTestCases("CCV", 205),
      RomanToIntTestCases("CDXLIV", 444),
      RomanToIntTestCases("CMXCIX", 999),
      RomanToIntTestCases("M", 1_000),
      RomanToIntTestCases("MMMDCCCLXXXVIII", 3_888),
      RomanToIntTestCases("MMMCMX", 3_910),
    ];

    for (final step in testCases) {
      final roman = step.roman;
      final arabic = step.arabic;
      test("Testing the roman numeral \x1b[38;5;221m'$roman'\x1b[0m correctly converts to the appropriate arabic number $arabic\x1b[0m", () {
        int result = romanToInt(roman);
        expect(result, equals(arabic));
      });
    }
  });
}
