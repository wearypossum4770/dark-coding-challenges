import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/check_perfect_number.dart';

class CheckPerfectNumberTestCases {
  String criteria;
  String classification;
  int n;
  bool expected;
  int actual;

  CheckPerfectNumberTestCases(this.criteria, this.classification, this.n, this.expected, this.actual);
}

void main() {
  group("Feature:", () {
    final testCases = [
      CheckPerfectNumberTestCases('perfect number 496', 'perfect', 496, true, 496),
      CheckPerfectNumberTestCases('perfect number 8128', 'perfect', 8128, true, 8128),
      CheckPerfectNumberTestCases('perfect number 8589869056', 'perfect', 8589869056, true, 8589869056),
      CheckPerfectNumberTestCases('perfect number 137438691328', 'perfect', 137438691328, true, 137438691328),
      CheckPerfectNumberTestCases('Smallest perfect number', 'perfect', 6, true, 6),
      CheckPerfectNumberTestCases('Medium perfect number', 'perfect', 28, true, 28),
      CheckPerfectNumberTestCases('Large perfect number', 'perfect', 33550336, true, 33550336),
      CheckPerfectNumberTestCases('Smallest abundant number', 'abundant', 12, false, 16),
      CheckPerfectNumberTestCases('Medium abundant number', 'abundant', 30, false, 42),
      CheckPerfectNumberTestCases('Large abundant number', 'abundant', 33550335, false, 39885825),
      CheckPerfectNumberTestCases('Smallest prime deficient number', 'deficient', 2, false, 1),
      CheckPerfectNumberTestCases('Smallest non-prime deficient number', 'deficient', 4, false, 3),
      CheckPerfectNumberTestCases('Medium deficient number', 'deficient', 32, false, 31),
      CheckPerfectNumberTestCases('Large deficient number', 'deficient', 33550337, false, 1),
    ];

    for (final step in testCases) {
      final criteria = step.criteria;
      final classification = step.classification;
      final n = step.n;
      final expected = step.expected;
      final actual = step.actual;
      test("\n\tCriteria: $criteria\n\tGiven: the number $n.\n\tWhen: its aliquot sum is matched.\n\tThen: it will be $expected", () {
        bool result = checkPerfectNumber(n);
        expect(result, equals(expected));
      });
      test("\n\tCriteria: $criteria\n\tGiven: the number $n.\n\tThen: it is best classified as $classification", () {
        String result = classifyPerfectNumber(n);
        expect(result, equals(classification));
      });
      test("\n\tCriteria: $criteria\n\tGiven: the number $n.\n\tWhen its aliquot sum is calculated it is $actual", () {
        int result = calculatePerfectNumber(n);
        expect(result, equals(actual));
      });
    }
  });
}
