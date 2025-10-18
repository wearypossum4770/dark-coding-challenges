import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_even_digit_numbers.dart';

class FindEvenDigitNumbersTestCases {
  List<int> nums;
  int expected;
  FindEvenDigitNumbersTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindEvenDigitNumbersTestCases([12, 345, 2, 6, 7896], 2),
      FindEvenDigitNumbersTestCases([555, 901, 482, 1771], 1),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tThen: it has $expected even digit numbers.", () {
        int actual = findEvenDigitNumbers(nums);
        expect(actual, equals(expected));
      });
    }
  });
}
