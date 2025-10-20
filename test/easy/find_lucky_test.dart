import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_lucky.dart';

class FindLuckyTestCases {
  List<int> arr;
  int expected;
  FindLuckyTestCases(this.arr, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindLuckyTestCases([2, 2, 3, 4], 2),
      FindLuckyTestCases([1, 2, 2, 3, 3, 3], 3),
      FindLuckyTestCases([2, 2, 2, 3, 3], -1),
    ];

    for (final step in testCases) {
      final arr = step.arr;
      final expected = step.expected;
      test("\n\tGiven: the array $arr.\n\tThen: the maximum frequency relationship between the value and index is $expected.", () {
        int actual = findLucky(arr);
        expect(actual, equals(expected));
      });
    }
  });
}
